import Foundation

/// Encodes data into a request's HTTP body.
public struct JSONBodyEncoder: BodyEncoder {
    /**
     Encodes provided data as the message body in JSON format into the provided request.

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
