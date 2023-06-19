import XCTest
import NetworkService

final class NetworkServiceTests: XCTestCase {
    func testMethodExistsInAPI() {
        NetworkService().testUse()
    }
}
