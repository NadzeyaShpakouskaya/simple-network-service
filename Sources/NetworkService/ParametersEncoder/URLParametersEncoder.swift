import Foundation

public struct URLParametersEncoder: ParametersEncoder {
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
                value: value
            )
        }
    }
}
