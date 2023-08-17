import NetworkService
import XCTest

final class NetworkServiceInternalErrorLocalizedErrorTests: XCTestCase {
    func testLocalizedDescriptionReturnExpectedString() {
        let serializationFailDescription = "The provided data can not be serialized."

        XCTAssertEqual(NetworkServiceInternalError.serializationFailure.errorDescription, serializationFailDescription)
    }
}
