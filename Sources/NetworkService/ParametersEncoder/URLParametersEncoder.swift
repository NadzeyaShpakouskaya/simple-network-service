import Foundation

/// Encodes data into an `URLRequest`'s URL.
public struct URLParametersEncoder: ParametersEncoder {
    /**
     Encodes `URLParameters` as the URL into the provided `URLRequest`.
     
     - Parameters:
        - parameters: An optional `URLParameters` object containing the data to be encoded.
        - request: An `inout` `URLRequest` object to which the encoded URL will be assigned.
     */
    public static func encode(_ parameters: URLParameters?, into request: inout URLRequest) {
        guard let url = request.url, let parameters = parameters else { return }

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems(from: parameters)

        request.url = urlComponents?.url
    }

    private static func queryItems(from parameters: URLParameters) -> [URLQueryItem] {
        parameters.map { key, value in
            URLQueryItem(
                name: key,
                value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
            )
        }
    }
}
