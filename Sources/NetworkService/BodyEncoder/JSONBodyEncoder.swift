import Foundation

/// Encodes data into an `URLRequest`'s HTTP body.
public struct JSONBodyEncoder: BodyEncoder {
    /**
     Encodes `BodyParameters` as the message body into the provided `URLRequest`.

     - Parameters:
        - parameters: An optional set of parameters that contains the data to encode.
        - request: A request object in which provided parameters will be encoded.

     - Throws: An error if the encoding process fails.
     */
    public static func encode(_ parameters: BodyParameters?, into request: inout URLRequest) throws {
        guard let parameters else { return }

        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
            throw NetworkServiceInternalError.serializationFailure
        }

        request.httpBody = jsonData
    }
}
