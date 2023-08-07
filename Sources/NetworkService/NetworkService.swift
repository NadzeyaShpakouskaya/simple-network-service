import Foundation
/// ToDo Doc comments
final public class NetworkService<Endpoint: HTTPAPIEndpoint>: NetworkRouter {
    public var defaultTimeoutIntervalInSeconds: TimeInterval = 10.0

    public func request(_ route: Endpoint) async -> Result<Data, Error> {
        return await send(request(from: route))
    }

    // MARK: - Private interface
    private var task: URLSessionTask?

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
            JSONBodyEncoder.encode(bodyParameters, into: &request)
        }

        request.httpMethod = route.method.rawValue
        route.headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        return request
    }

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
