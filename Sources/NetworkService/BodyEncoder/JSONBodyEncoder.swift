import Foundation

/// Encodes data into an `URLRequest`'s HTTP body.
public struct JSONBodyEncoder: BodyEncoder {
    /**
     Encodes `BodyParameters` as the message body into the provided `URLRequest`.
     
     - Parameters:
     - parameters: An optional `BodyParameters` object containing the data to be encoded.
     - request: An `inout` `URLRequest` object to which the encoded body will be assigned.
     
     - Throws: An error of type `InternalError` if the encoding process fails.
     */
    public static func encode(_ parameters: BodyParameters?, into request: inout URLRequest) throws {
        guard let parameters = parameters else { return }
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
            throw InternalError.serializationFailure
        }
        
        guard let jsonObject = try? JSONSerialization.jsonObject(with: jsonData),
                JSONSerialization.isValidJSONObject(jsonObject) else {
            throw InternalError.invalidJSONObject
        }
        
        request.httpBody = jsonData
    }
}
