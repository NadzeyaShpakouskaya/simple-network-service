/// Defines a set of internal errors that can occur during using the `NetworkService`.
public enum NetworkServiceInternalError: Error, CaseIterable {
    /// Represents a failure during serialization or deserialization operations.
    case serializationFailure

    public var localizedDescription: String {
        switch self {
        case .serializationFailure:
            return "The provided data can not be serialized."
        }
    }
}
