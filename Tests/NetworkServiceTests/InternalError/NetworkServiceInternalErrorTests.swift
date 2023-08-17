import NetworkService
import XCTest

final class NetworkServiceInternalErrorTests: XCTestCase {
    func testAllNetworkServiceInternalErrorsExistInAPI() {
        // Given
        let setOfErrors = Set(NetworkServiceInternalError.allCases)

        // When
        let expectedErrors: Set<NetworkServiceInternalError> = [
            .serializationFailure
        ]

        // Then
        XCTAssertEqual(setOfErrors, expectedErrors)
    }

    func testNetworkServiceInternalErrorConformsToErrorProtocol() {
        XCTAssertNotNil(NetworkServiceInternalError.self as Error.Type)
    }
}
