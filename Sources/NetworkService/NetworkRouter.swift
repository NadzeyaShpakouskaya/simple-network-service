import Foundation

/// A protocol defining the contract for a network router that can send requests to server endpoints.
public protocol NetworkRouter: AnyObject {
    associatedtype Endpoint
    
    /// Sends a request to the specified server endpoint.
    /// - Parameter route: The endpoint to which the request is to be sent.
    /// - Returns: A `Result` object containing either the received data or an error in case of failure.
    func request(_ route: Endpoint) async -> Result<Data, Error>
}
