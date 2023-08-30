import Foundation

/// Defines the contract for a network router that can send requests to server endpoints.
public protocol NetworkRouter: AnyObject {
    /// The associated type representing the specific endpoint configuration.
    associatedtype Endpoint
    
    /// Sends a request to the specified server endpoint.
    /// - Parameter route: The endpoint to which the request is to be sent.
    /// - Returns: A `Result` object containing either the received data or an error in case of failure.
    /// - Throws: A conforming implementations may throw errors if there are an issue during execution.
    func request(_ route: Endpoint) async throws -> Data
}
