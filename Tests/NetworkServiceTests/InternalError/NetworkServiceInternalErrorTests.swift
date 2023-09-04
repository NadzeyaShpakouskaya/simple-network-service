import NetworkService
import XCTest

final class NetworkServiceInternalErrorTests: XCTestCase {
    func testAllNetworkServiceInternalErrorsExistInAPI() {
        // Given
        let setOfErrors = Set(NetworkServiceInternalError.allCases)

        // When
        let expectedErrors: Set<NetworkServiceInternalError> = [
            .serializationFailure,
        ]

        // Then
        XCTAssertEqual(setOfErrors, expectedErrors)
    }

    func testNetworkServiceInternalErrorConformsToErrorProtocol() {
        XCTAssertNotNil(NetworkServiceInternalError.self as Error.Type)
    }

    func testLocalizedDescriptionReturnExpectedStringForAllNetworkServiceInternalErrors() {
        NetworkServiceInternalError.allCases.forEach { error in
            switch error {
            case .serializationFailure:
                XCTAssertEqual(error.localizedDescription, "The provided data can not be serialized.")
            }
        }
    }
}
