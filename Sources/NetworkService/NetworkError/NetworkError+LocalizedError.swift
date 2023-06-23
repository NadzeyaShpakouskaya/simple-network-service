import Foundation

extension NetworkError: LocalizedError {
    /// Provides a description of errors that may occur, while the application is running.
    public var errorDescription: String? {
        switch self {
        case .lostConnection:
            return "Lost connection to the server. Please check your internet connection and try again."
        case .serverUnavailable:
            return "The server is currently unavailable. Please try again later."
        case .badRequest:
            return "The server cannot process the request because an error was found in the request. Please check the request and try again."
        case .authenticationError:
            return "The authentication is required for access."
        case .requestTimeOut:
            return "The server timed out waiting for the request. Please try again."
        case .sessionExpired:
            return "The session has expired. Please try again."
        case .invalidURL:
            return "The server cannot process the request due to an invalid URL."
        case .missingData:
            return "The server successfully processed the request, but there is no data for the request."
        case .unknownError:
            return "Unknown error. Please try again"
        }
    }
}
