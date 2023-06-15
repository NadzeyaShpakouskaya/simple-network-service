import XCTest
@testable import NetworkService

final class NetworkServiceTests: XCTestCase {
    func testMethodExistsInAPI() {
        NetworkService().testUse()
    }
}
