import NetworkService
import XCTest

final class NetworkErrorTests: XCTestCase {
    func testAllNetworkErrorsExistInAPI() {
        // Given
        let setOfNetworkErrors = Set(NetworkError.allCases)

        // When
        let expectedNetworkErrors: Set<NetworkError> = [
            .badRequest,
            .badResponse,
            .authenticationError,
            .clientError,
            .serverError,
            .requestTimeout,
            .unknownError,
        ]

        // Then
        XCTAssertEqual(setOfNetworkErrors, expectedNetworkErrors)
    }

    func testNetworkErrorConformsToErrorProtocol() {
        XCTAssertNotNil(NetworkError.self as Error.Type)
    }
}
