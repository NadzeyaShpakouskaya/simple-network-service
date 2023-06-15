import XCTest
@testable import NetworkService

final class NetworkServiceTests: XCTestCase {
    func testUseReturnTrue() {
        XCTAssertTrue(NetworkService().use())
    }
}
