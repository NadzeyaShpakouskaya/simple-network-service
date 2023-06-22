import Foundation

/// Contains network errors that may occur, while the application is running.
public enum NetworkError: Error, CaseIterable {
    /// Indicates that the Internet connection has been lost.
    case lostConnection
    
    /// Indicates that the server cannot handle the request (because it is overloaded or down for maintenance).
    case serverUnavailable
    
    /// Indicates that the server cannot process the request due to a client error
    /// (e.g., malformed request syntax, size too large, invalid request message framing, or deceptive request routing).
    case badRequest
    
    /// Indicates that the request to connect and log on to an FTP server could not be completed
    /// because the supplied password is incorrect.
    case passwordError
    
    /// Indicates that the request to connect to and log on to an FTP server failed.
    case loginError
    
    /// Indicates that the server stopped waiting for the request because the client took too long to produce a request.
    case requestTimeOut
    
    /// Indicates that the client's session has expired and must log in again.
    case sessionExpired
    
    /// Indicates that the Uniform Resource Locator is invalid.
    case invalidURL
    
    /// Indicates that the response was successful, but no data comes back.
    case missingData
    
    /// Not specified error.
    case unknownError
}
