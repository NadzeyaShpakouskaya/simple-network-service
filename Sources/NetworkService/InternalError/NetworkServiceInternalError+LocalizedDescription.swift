import Foundation

extension NetworkServiceInternalError {
    public var localizedDescription: String {
        switch self {
        case .serializationFailure:
            return "The provided data can not be serialized."
        }        
    }
}
