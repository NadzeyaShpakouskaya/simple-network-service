import Foundation

/// A role of a user in the app's session. A user can have one active role.
public enum NetworkError: Error, Codable, CaseIterable {
    /// Indicates, that the Internet connection has been lost.
    case lostConnection
    
    /// Indicates, that the server cannot handle the request (because it is overloaded or down for maintenance).
    case serverUnavailable
    
    /// Indicates, that the server can not or will not process the request due to an apparent client error
    /// (e.g., malformed request syntax, size too large, invalid request message framing, or deceptive request routing).
    /// or
    /// The request could not be understood by the server due to invalid syntax.
    case badRequest
    
    /// Indicates, that the client needs to authenticate to gain network access.
    case authenticationError
    
    /// Indicates, that the request to connect and log on to an FTP server could not be completed because the supplied user name is incorrect.
    case userNameError
    
    /// Indicates, that the request to connect and log on to an FTP server could not be completed because the supplied password is incorrect.
    case passwordError

    /// Indicates, that the request to connect to and log on to an FTP server failed.
    case loginError

    /// Indicates, that the server timed out waiting for the request.
    /// The client did not produce a request within the time that the server was prepared to wait.
    /// The client may repeat the request without modifications at any later time.
    case requestTimeOut
    
    /// Indicates, that the client's session has expired and must log in again.
    case LoginTimeOut
    
    /// Indicates, that the Uniform Resource Locator is invalid.
    case invalidURL

    /// Not specified error.
    case unknownError
    
    /// Indicates, that decoding of json responses was failed.
    case decodingError
}