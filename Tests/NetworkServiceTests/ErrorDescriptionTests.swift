import NetworkService
import XCTest

final class ErrorDescriptionTests: XCTestCase {
    func testErrorDescriptionExistsInAPI() {
        
        XCTAssertEqual(NetworkError.lostConnection.localizedDescription, "lostConnection")
        XCTAssertEqual(NetworkError.serverUnavailable.localizedDescription, "serverUnavailable")
        XCTAssertEqual(NetworkError.badRequest.localizedDescription, "badRequest")
        XCTAssertEqual(NetworkError.passwordError.localizedDescription, "passwordError")
        XCTAssertEqual(NetworkError.loginError.localizedDescription, "loginError")
        XCTAssertEqual(NetworkError.requestTimeOut.localizedDescription, "requestTimeOut")
        XCTAssertEqual(NetworkError.sessionExpired.localizedDescription, "sessionExpired")
        XCTAssertEqual(NetworkError.invalidURL.localizedDescription, "invalidURL")
        XCTAssertEqual(NetworkError.missingData.localizedDescription, "missingData")
        XCTAssertEqual(NetworkError.unknownError.localizedDescription, "unknownError")
    }
}
