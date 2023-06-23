import NetworkService
import XCTest

final class NetworkErrorTests: XCTestCase {
    func testAllNetworkErrorsExistInAPI() {
        // Given
        let possibleNetworkErrors = Set(NetworkError.allCases)

        // When
        let expectedNetworkErrors: Set = [
            NetworkError.badRequest,
            NetworkError.authenticationError,
            NetworkError.clientError,
            NetworkError.serverError,
            NetworkError.requestTimeout,
            NetworkError.unknownError,
        ]

        // Then
        XCTAssertEqual(possibleNetworkErrors, expectedNetworkErrors)
    }

    func testNetworkErrorsConformToError() {
        XCTAssertNotNil(NetworkError.self as Error.Type)
    }
}
