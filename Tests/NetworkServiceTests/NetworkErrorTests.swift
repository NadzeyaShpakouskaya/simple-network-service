import NetworkService
import XCTest

final class NetworkErrorTests: XCTestCase {
    func testAllNetworkErrorsExistInAPI() {
        // Given
        let possibleNetworkErrors = Set(NetworkError.allCases)

        // When
        let expectedNetworkErrors = Set([
            NetworkError.lostConnection,
            NetworkError.serverUnavailable,
            NetworkError.badRequest,
            NetworkError.passwordError,
            NetworkError.loginError,
            NetworkError.requestTimeOut,
            NetworkError.sessionExpired,
            NetworkError.invalidURL,
            NetworkError.missingData,
            NetworkError.unknownError,
        ])

        // Then
        XCTAssertEqual(possibleNetworkErrors, expectedNetworkErrors)
    }
    
    func testNetworkErrorsConformToError() {
       XCTAssertNotNil(NetworkError.self as Error.Type)
    }
}
