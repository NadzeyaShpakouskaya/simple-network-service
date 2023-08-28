import Foundation
/// Encodes URL parameters into the request's URL.
public struct URLParametersEncoder: ParametersEncoder {
    /// Encodes the provided set of URL parameters into the given request's URL.
    ///
    /// In the result, the provided set of URL parameters gets the query string of the request's URL.
    /// If the `nil` is submitted as parameters, the request's URL retains the original value.
    ///
    /// - Parameters:
    ///   - parameters: An optional set of URL parameters to be encoded.
    ///   - request: The request object to which URL the encoded parameters will be assigned.
    public static func encode(_ parameters: URLParameters?, into request: inout URLRequest) {
        guard let url = request.url, let parameters = parameters else { return }

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems(from: parameters)

        request.url = urlComponents?.url
    }

    /// Create a collection of query items from the provided set of URL parameters.
    ///
    /// - Parameter parameters: The set of URL parameters to be converted to query items.
    /// - Returns: The collection of resulting query items.
    /// - Complexity: O(*N*), where *N* is the length of the set of parameters.
    public static func queryItems(from parameters: URLParameters) -> [URLQueryItem] {
        parameters.map { key, value in
            URLQueryItem(
                name: key,
                value: value
            )
        }
    }
}
