import NetworkService
import XCTest

final class NetworkErrorTests: XCTestCase {
    func testAllNetworkErrorsExistInAPI() {
        XCTAssertTrue(NetworkError.allCases.contains(.authenticationError))
        XCTAssertTrue(NetworkError.allCases.contains(.badRequest))
        XCTAssertTrue(NetworkError.allCases.contains(.LoginTimeOut))
        XCTAssertTrue(NetworkError.allCases.contains(.decodingError))
        XCTAssertTrue(NetworkError.allCases.contains(.invalidURL))
        XCTAssertTrue(NetworkError.allCases.contains(.loginError))
        XCTAssertTrue(NetworkError.allCases.contains(.lostConnection))
        XCTAssertTrue(NetworkError.allCases.contains(.passwordError))
        XCTAssertTrue(NetworkError.allCases.contains(.requestTimeOut))
        XCTAssertTrue(NetworkError.allCases.contains(.serverUnavailable))
        XCTAssertTrue(NetworkError.allCases.contains(.unknownError))
        XCTAssertTrue(NetworkError.allCases.contains(.decodingError))
    }
}
