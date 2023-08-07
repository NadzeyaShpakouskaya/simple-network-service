import NetworkService
import XCTest

final class HTTPTaskTests: XCTestCase {
    func testHTTPTaskCasesPresentInAPI() {
        _ = HTTPTask.request
        _ = HTTPTask.requestWithURLParameters(urlParameters: nil)
        _ = HTTPTask.requestWithBodyParameters(bodyParameters: nil)
    }
}
