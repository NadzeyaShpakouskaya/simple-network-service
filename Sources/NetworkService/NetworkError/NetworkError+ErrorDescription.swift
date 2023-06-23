import Foundation

extension NetworkError: LocalizedError {
    /// Provides a description of errors that may occur, while the application is running.
    public var errorDescription: String? {
        
        switch self {
        case .lostConnection:
            return "lostConnection"
        case .serverUnavailable:
            return "serverUnavailable"
        case .badRequest:
            return "badRequest"
        case .authenticationError:
            return "authenticationError"
        case .requestTimeOut:
            return "requestTimeOut"
        case .sessionExpired:
            return "sessionExpired"
        case .invalidURL:
            return "invalidURL"
        case .missingData:
            return "missingData"
        case .unknownError:
            return "unknownError"
        }
    }
}
