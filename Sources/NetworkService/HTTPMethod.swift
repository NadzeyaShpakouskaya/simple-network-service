/// The method to use in the HTTP requests.
/// Indicates what actions to be performed by the remote host.
public enum HTTPMethod: String {
    /// The `GET` method according to the [RFC 7231](https://datatracker.ietf.org/doc/html/rfc7231#section-4.3.1).
    case get = "GET"

    /// The `POST` method according to the [RFC 7231](https://datatracker.ietf.org/doc/html/rfc7231#section-4.3.3).
    case post = "POST"

    /// The `PUT` method according to the [RFC 7231](https://datatracker.ietf.org/doc/html/rfc7231#section-4.3.4).
    case put = "PUT"
}
