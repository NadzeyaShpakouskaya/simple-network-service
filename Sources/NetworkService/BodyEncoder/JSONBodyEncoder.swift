import Foundation

/// Encodes data into an `URLRequest`'s HTTP body.
struct JSONBodyEncoder: BodyEncoder {
    /**
     Encodes `BodyParameters` as the message body into the provided `URLRequest`.
     
     - Parameters:
     - parameters: An optional `BodyParameters` object containing the data to be encoded.
     - request: An `inout` `URLRequest` object to which the encoded body will be assigned.
     
     - Throws: An error of type `NetworkError.badRequest` if the encoding process fails due to an invalid JSON object.
     */
    static func encode(_ parameters: BodyParameters?, into request: inout URLRequest) throws {
        guard let parameters = parameters else { return }
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters),
              JSONSerialization.isValidJSONObject(jsonData) else {
            throw NetworkError.badRequest
        }
        
        request.httpBody = jsonData
    }
}

