import NetworkService
import XCTest

final class NetworkServiceInternalErrorTests: XCTestCase {
    func testAllNetworkServiceInternalErrorsExistInAPI() {
        let setOfNetworkErrors = Set(NetworkServiceInternalError.allCases)

        let expectedNetworkErrors: Set<NetworkServiceInternalError> = [
            .serializationFailure
        ]

        XCTAssertEqual(setOfNetworkErrors, expectedNetworkErrors)
    }

    func testNetworkServiceInternalErrorConformsToErrorProtocol() {
        XCTAssertNotNil(NetworkServiceInternalError.self as Error.Type)
    }
}
