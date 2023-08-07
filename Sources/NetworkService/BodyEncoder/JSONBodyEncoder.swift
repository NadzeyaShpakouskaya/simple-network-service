import Foundation

/// Encodes data into an `URLRequest`'s HTTP body.

public struct JSONBodyEncoder: BodyEncoder {
    /**
     Encodes `BodyParameters` as the message body into the provided `URLRequest`.
     
     - Parameters:
     - parameters: An optional `BodyParameters` object containing the data to be encoded.
     - request: An `inout` `URLRequest` object to which the encoded body will be assigned.
     
     - Throws: An error of type `NetworkError.badRequest` if the encoding process fails due to an invalid JSON object.
     */
    public static func encode(_ parameters: BodyParameters?, into request: inout URLRequest) throws {
        guard let parameters = parameters else { return }
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters),
              JSONSerialization.isValidJSONObject(jsonData) else {
            throw InternalError.serializationFailure
        }
        
        guard JSONSerialization.isValidJSONObject(jsonData) else {
            throw InternalError.invaldJSONObject
        }
        
        request.httpBody = jsonData
    }
}

/// The set of key-value pairs those make up the body of the HTTP request.
public typealias BodyParameters = [String: Any]
