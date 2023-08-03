/// A type of the request depending on availability and type of additional parameters.
public enum HTTPTask {
    /// The НТТР request without any parameters.
    case request

    /// The НТТР request that specify the parameters of the data that is
    /// being queried from a server.
    case requestWithURLParameters(urlParameters: URLParameters?)

    /// The НТТР request that has a body.
    case requestWithBodyParameters(bodyParameters: BodyParameters?)
}
