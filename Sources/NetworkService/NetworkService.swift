import Foundation

/// Handles sending requests and receiving responses.
public final class NetworkService<Endpoint: HTTPAPIEndpoint>: NetworkRouter {
    /// The default timeout interval (in seconds) for network requests.
    public var defaultTimeoutIntervalInSeconds: TimeInterval = 10.0
    
    /// Sends a network request to the specified server endpoint.
    ///
    /// - Parameter route: The endpoint representing the target server location and details of the request.
    /// - Returns: A `Result` object containing either the received data or an error in case of failure.
    public func request(_ route: Endpoint) async -> Result<Data, Error> {
        return await send(request(from: route))
    }
    
    // MARK: - Private interface
    
    /// The current URLSessionTask for the network request.
    private var task: URLSessionTask?
    
    /// Creates a URLRequest from the specified endpoint.
    /// - Parameter route: The endpoint for which the URLRequest is to be created.
    /// - Returns: A URLRequest object representing the request to the endpoint.
    private func request(from route: Endpoint) -> URLRequest {
        var request = URLRequest(
            url: route.baseURL.appendingPathComponent(route.path),
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: defaultTimeoutIntervalInSeconds
        )
        
        switch route.task {
        case .request:
            break
        case .requestWithURLParameters(let urlParameters):
            URLParametersEncoder.encode(urlParameters, into: &request)
        case .requestWithBodyParameters(let bodyParameters):
            do {
                try JSONBodyEncoder.encode(bodyParameters, into: &request)}
            catch {
                print("Error encoding JSON body: \(error)")
            }
        }
        
        request.httpMethod = route.method.rawValue
        route.headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }
    
    /// Sends the specified URLRequest and handles the response.
    /// - Parameter request: The URLRequest to be sent.
    /// - Returns: A `Result` object containing either the received data or an error in case of failure.
    private func send(_ request: URLRequest) async -> Result<Data, Error> {
        do {
            let (rawData, response) = try await URLSession.shared.data(for: request)
            switch handle(response) {
            case .success(_): return .success(rawData)
            case .failure(let error): return .failure(error)
            }
        } catch {
            // TODO: Handle session timeout
            if (error as? URLError)?.code == .timedOut {}
            return .failure(error)
        }
    }
    
    /// Handles the received URLResponse and determines the result of the network request.
    /// - Parameter response: The URLResponse received from the server.
    /// - Returns: A `Result` object containing either success or an error based on the response status code.
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
