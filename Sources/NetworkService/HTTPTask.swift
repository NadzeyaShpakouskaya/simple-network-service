/// A type of the request depending on availability and type of additional parameters.
public enum HTTPTask {
    /// The НТТР request without any parameters.
    case request

    /// The НТТР request with the provided URL parameters to be included in the request.
    case requestWithURLParameters(urlParameters: URLParameters?)

    /// The НТТР request that sends provided parameters as a request body.
    case requestWithBodyParameters(bodyParameters: BodyParameters?)
}
