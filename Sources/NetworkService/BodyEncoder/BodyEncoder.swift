import Foundation

/// A protocol for encoding body parameters into an `URLRequest`.
public protocol BodyEncoder {
    /**
     Encodes body parameters (such as JSON, URL-encoded form data, etc.) into the provided `URLRequest`.

     - Parameters:
        - parameters: An optional `BodyParameters` object containing the data to be encoded.
        - request: An `inout` `URLRequest` object to which the encoded body will be assigned.

     - Throws: Implementations of this method may throw errors if there are issues during the encoding process.
     */
    static func encode(_ parameters: BodyParameters?, into request: inout URLRequest) throws
}
