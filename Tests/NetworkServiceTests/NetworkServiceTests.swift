import NetworkService
import XCTest

final class NetworkServiceTests: XCTestCase {
    func testUseMethodExistsInAPI() {
        NetworkService().testUse()
    }
}
