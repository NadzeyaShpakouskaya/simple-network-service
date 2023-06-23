import NetworkService
import XCTest

final class NetworkErrorLocalizedErrorTests: XCTestCase {
    func testErrorDescriptionExistsInAPI() {
        _ = NetworkError.badRequest.localizedDescription
        _ = NetworkError.authenticationError.localizedDescription
        _ = NetworkError.clientError.localizedDescription
        _ = NetworkError.serverError.localizedDescription
        _ = NetworkError.requestTimeout.localizedDescription
        _ = NetworkError.unknownError.localizedDescription
    }
}
