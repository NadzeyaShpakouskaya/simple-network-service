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
        case .passwordError:
            return "passwordError"
        case .loginError:
            return "loginError"
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
