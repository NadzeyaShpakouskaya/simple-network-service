import NetworkService
import XCTest

final class NetworkServiceInternalErrorLocalizedErrorTests: XCTestCase {
    func testLocalizedDescriptionReturnExpectedString() {
        XCTAssertEqual(
            NetworkServiceInternalError.serializationFailure.localizedDescription,
            "The provided data can not be serialized."
        )
    }
}
