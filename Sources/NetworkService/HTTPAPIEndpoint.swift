import Foundation

/// Describes an API endpoint that supports communication by HTTP protocol.
public protocol HTTPAPIEndpoint {
    
    associatedtype Environment

    static var networkEnvironment: Environment { get set }

    var baseURL: URL { get }
    var path: String { get }
    var task: HTTPTask { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
}
