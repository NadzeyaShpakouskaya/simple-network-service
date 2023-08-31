import NetworkService
import Foundation

/// Represents a mock HTTP API endpoint for testing purposes.
struct MockEndpoint: HTTPAPIEndpoint {
    static var networkEnvironment: String = "test"
    var baseURL: URL = .init(string: "https://api.example.com")!
    var path: String = "/endpoint"
    var task: HTTPTask = .request
    var method: HTTPMethod = .get
    var headers: HTTPHeaders = [:]
}
