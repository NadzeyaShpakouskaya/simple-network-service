import Foundation

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "The server cannot process the request because an error was found in the request. Please check the request and try again."
        case .authenticationError:
            return "The request was not completed. The authentication is required for access."
        case .clientError:
            return "The server cannot process the request due to a client error."
        case .serverError:
            return "The server cannot process the request due to a issue with the server."
        case .requestTimeout:
            return "The server timed out waiting for the request. Please try again."
        case .unknownError:
            return "Unknown error. Please try again."
        }
    }
}
