import NetworkService
import XCTest

final class NetworkServiceInternalErrorLocalizedErrorTests: XCTestCase {
    func testLocalizedDescriptionReturnExpectedString() {
        // Given
        let serializationFailDescription = "The provided data can not be serialized."

        // When // Then
        XCTAssertEqual(NetworkServiceInternalError.serializationFailure.errorDescription, serializationFailDescription)
    }
}
