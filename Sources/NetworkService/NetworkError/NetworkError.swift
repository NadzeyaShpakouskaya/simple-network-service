import Foundation

/// Contains network errors that may occur, while the application is running.
public enum NetworkError: Error, CaseIterable {
    /// Indicates that the server cannot process the request due to a client error
    /// (e.g., malformed request syntax, size too large, invalid request message framing,
    /// or deceptive request routing).
    case badRequest

    /// Indicates that the response from the server is invalid or the client couldn't parse it.
    case badResponse

    /// Indicates that the client request has not been completed
    /// because it lacks valid authentication credentials for the requested resource.
    case authenticationError

    /// Indicates the server cannot or will not process the request
    /// due to something that is perceived to be a client error.
    case clientError

    /// Indicates the server cannot or will not process the request due to server issue.
    case serverError

    /// Indicates that the client stopped waiting for the resource and the resource was not transferred entirely.
    case resourceTimeout

    /// Indicates that an unknown error has occurred.
    case unknownError
}
