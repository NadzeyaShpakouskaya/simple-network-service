/// A type of the request depending on availability and type of additional parameters.
public enum HTTPTask {
    /// The set of key-value pairs those make up query string of the URL that specify
    /// the parameters of the data that is being queried from a server.
    public typealias URLParameters = [String: String]

    /// The set of key-value pairs those make up the body of the HTTP request.
    public typealias BodyParameters = [String: Any]

    /// The НТТР request without any parameters.
    case request

    /// The НТТР request that specify the parameters of the data that is
    /// being queried from a server.
    case requestWithURLParameters(urlParameters: URLParameters?)

    /// The НТТР request that has a body.
    case requestWithBodyParameters(bodyParameters: BodyParameters?)
}
