import Foundation

/// A protocol for encoding URL parameters into an `URLRequest`.
public protocol ParametersEncoder {
    /**
     Encodes URL parameters into the provided `URLRequest`.
     
     - Parameters:
        - parameters: An optional `URLParameters` object containing the data to be encoded.
        - request: An `inout` `URLRequest` object to which the encoded URL will be assigned.
    */
    static func encode(_ parameters: URLParameters?, into request: inout URLRequest)
}
