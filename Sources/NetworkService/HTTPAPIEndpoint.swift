import Foundation

/// Describes the basic structure of an HTTP API endpoint that supports communication by HTTP protocol.
public protocol HTTPAPIEndpoint {
    /// The environment that defines endpoint's server location.
    associatedtype Environment

    /// The environment in which the API endpoints are being used. This could be different
    /// environments such as development, staging, or production.
    static var networkEnvironment: Environment { get set }

    /// The base URL for the API endpoint. It represents the common part of the URL for all requests related to this endpoint.
    var baseURL: URL { get }

    /// The relative path for the specific API endpoint, which will be appended to the baseURL to form the complete URL for the request.
    var path: String { get }

    /// Represent tasks which can be performed in an HTTP request.
    var task: HTTPTask { get }

    /// The method to use in the HTTP request.
    var method: HTTPMethod { get }

    /// HTTP header fields for the HTTP request.
    var headers: HTTPHeaders { get }
}
