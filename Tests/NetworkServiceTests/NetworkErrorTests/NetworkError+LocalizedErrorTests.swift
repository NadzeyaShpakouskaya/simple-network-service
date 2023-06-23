import NetworkService
import XCTest

final class NetworkErrorLocalizedErrorTests: XCTestCase {
    func testErrorDescriptionExistsInAPI() {
        _ = NetworkError.lostConnection.localizedDescription
        _ = NetworkError.serverUnavailable.localizedDescription
        _ = NetworkError.badRequest.localizedDescription
        _ = NetworkError.authenticationError.localizedDescription
        _ = NetworkError.requestTimeOut.localizedDescription
        _ = NetworkError.sessionExpired.localizedDescription
        _ = NetworkError.invalidURL.localizedDescription
        _ = NetworkError.missingData.localizedDescription
        _ = NetworkError.unknownError.localizedDescription
    }
}
