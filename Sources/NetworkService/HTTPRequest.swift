import Foundation

/// Encapsulates an HTTP request with the necessary components.
public struct HTTPRequest {
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
        body: String? = nil
    ) {
        self.URI = URI
        self.requestMethod = requestMethod
        self.body = requestMethod != .get ? body : nil
    }

    /// The URL of the request.
    public let URI: URL

    /// The HTTP request method.
    public let requestMethod: HTTPMethod

    /// HTTP header fields for the request.
    public var allHTTPHeaders: HTTPHeaders {
        return headers
    }

    /// The data sent as the message body of the request.
    public let body: String?

    /// Returns the requested incoming header value.
    ///
    /// - Parameter headerName: The header name to use for the lookup (case-insensitive).
    /// - Returns: The value associated with the header name, or nil if there is no corresponding header field.
    public func value(for headerName: HTTPHeaderName) -> String? {
        headers[headerName.lowercased()]
    }

    /// Adds a value to the header field.
    ///
    /// This method provides the ability to add values to header fields incrementally.
    /// If a value was previously set for the specified field, the supplied
    /// value is appended to the existing value using the appropriate field delimiter (a comma).
    ///
    /// - Parameters:
    ///   - value: The value for the header field.
    ///   - headerName: The name of the header field. In keeping with the HTTP
    ///   RFC, HTTP header field names are case insensitive.
    public mutating func addValue(_ value: HTTPHeaderValue, for headerName: HTTPHeaderName) {
        if let currentValue = headers[headerName] {
            headers[headerName] = currentValue + ",\(value)"
        } else {
            headers[headerName] = value
        }
    }

    /// Sets a value for the header field. If the header already exists, the
    /// existing value will be replaced.
    ///
    /// - Parameters:
    ///   - value: The new value for the header field. Any existing value for
    ///   the field is replaced by the new value.
    ///   - headerName: The name of the header field to set. In keeping with the
    ///   HTTP RFC, HTTP header field names are case insensitive.
    public mutating func setValue(_ value: HTTPHeaderValue, for headerName: HTTPHeaderName) {
        headers[headerName] = value
    }

    // MARK: - Private interface

    private var headers = HTTPHeaders()
}
