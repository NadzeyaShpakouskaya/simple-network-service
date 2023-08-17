import Foundation

/// A protocol for encoding body parameters into an `URLRequest`.
public protocol BodyEncoder {
    /**
     Encodes body parameters (such as JSON, URL-encoded form data, etc.) into the provided request.

     - Parameters:
        - parameters: An optional set of parameters that contains the data to encode.
        - request: A request object in which provided parameters will be encoded.
     - Throws: A conforming implementations may throw errors if there are issues during the encoding process.
     */
    static func encode(_ parameters: BodyParameters?, into request: inout URLRequest) throws
}
