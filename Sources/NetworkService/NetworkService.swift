import Foundation

// MARK: - Public interface

/// Handles sending requests and receiving responses.
public final class NetworkService<Endpoint: HTTPAPIEndpoint>: NetworkRouter {
    /// The default timeout interval (in seconds) for network requests.
    public var defaultTimeoutIntervalInSeconds: TimeInterval = 10.0

    /// Initializes a new instance of the `NetworkService` class.
    public init() {}

    /// Sends a network request to the specified server endpoint.
    ///
    /// - Parameter route: The endpoint configuration containing all the necessary details of
    ///                   the request, including the target URL, HTTP method, headers, parameters,
    ///                   and any additional configuration required.
    /// - Returns: A `Result` object containing either the received data or an error in case of failure.
    /// - Throws: An error of type `NetworkError` if the request encounters an issue during execution.
    public func request(_ route: Endpoint) async throws -> Data {
        try await send(request(from: route))
    }

    // MARK: - Private interface

    private func request(from route: Endpoint) throws -> URLRequest {
        var request = URLRequest(
            url: route.baseURL.appendingPathComponent(route.path),
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: defaultTimeoutIntervalInSeconds
        )

        switch route.task {
        case .request:
            break
        case let .requestWithURLParameters(urlParameters):
            URLParametersEncoder.encode(urlParameters, into: &request)
        case let .requestWithBodyParameters(bodyParameters):
            try JSONBodyEncoder.encode(bodyParameters, into: &request)
        }

        request.httpMethod = route.method.rawValue
        route.headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        return request
    }

    private func send(_ request: URLRequest) async throws -> Data {
        let (rawData, response) = try await URLSession.shared.data(for: request)
        switch handle(response) {
        case .success(_):
            return rawData
        case let .failure(error):
            throw error
        }
    }

    private func handle(_ response: URLResponse) -> Result<Void, Error> {
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(NetworkError.badResponse)
        }

        switch httpResponse.statusCode {
        case 200...299:
            return .success(())
        case 400:
            return .failure(NetworkError.badRequest)
        case 401:
            return .failure(NetworkError.authenticationError)
        case 402...499:
            return .failure(NetworkError.clientError)
        case 500...599:
            return .failure(NetworkError.serverError)
        default:
            return .failure(NetworkError.unknownError)
        }
    }
}
