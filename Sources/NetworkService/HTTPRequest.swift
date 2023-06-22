import Foundation

/// Encapsulates an HTTP request with the necessary components.
public struct HTTPRequest {
    public typealias HTTPHeaderKey = String
    public typealias HTTPHeaderValue = String
    public typealias HTTPHeaders = [HTTPHeaderKey: HTTPHeaderValue]

    /// Creates a request with the provided parameters.
    ///
    /// - Parameters:
    ///    - URI: The URL of the request.
    ///    - requestMethod: The HTTP request method.
    ///    - headers: HTTP header fields for the request.
    ///    - body: The data sent as the message body of the request.
    ///    By default the body is `nil`.
    public init(
        URI: URL,
        requestMethod: HTTPMethod,
        headers: HTTPRequest.HTTPHeaders,
        body: String? = nil
    ) {
        self.URI = URI
        self.requestMethod = requestMethod
        self.headers = headers
        self.body = body
    }

    /// The URL of the request.
    public let URI: URL

    /// The HTTP request method.
    public let requestMethod: HTTPMethod

    /// HTTP header fields for the request.
    public let headers: HTTPHeaders

    /// The data sent as the message body of the request.
    public let body: String?
}
