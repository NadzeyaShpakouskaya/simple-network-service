import Foundation

/// A type that encodes URL parameters into a request.
public protocol ParametersEncoder {
    /// Encodes the provided set of parameters as URL parameters into the given request's URL.
    ///
    /// - Parameters:
    ///   - parameters: An optional set of URL parameters to be encoded.
    ///   - request: A request object to which URL the encoded parameters will be assigned.
    static func encode(_ parameters: URLParameters?, into request: inout URLRequest)
}
