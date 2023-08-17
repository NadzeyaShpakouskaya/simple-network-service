import Foundation

extension NetworkServiceInternalError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .serializationFailure:
            return "The provided data can not be serialized."
        }        
    }
}
