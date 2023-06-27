/// The method to use in the HTTP request. Indicates the method to be performed
/// on the resource identified by the Request-URI.
public enum HTTPMethod: String {
    /// The `GET` method according to the [RFC 7231](https://datatracker.ietf.org/doc/html/rfc7231#section-4.3.1).
    case get = "GET"

    /// The `POST` method according to the [RFC 7231](https://datatracker.ietf.org/doc/html/rfc7231#section-4.3.3).
    case post = "POST"

    /// The `PUT` method according to the [RFC 7231](https://datatracker.ietf.org/doc/html/rfc7231#section-4.3.4).
    case put = "PUT"
}
