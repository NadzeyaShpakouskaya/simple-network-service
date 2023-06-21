import NetworkService
import XCTest

final class HTTPMethodTests: XCTestCase {
    func testAllCasesExistInAPI() {
        _ = HTTPMethod.get
        _ = HTTPMethod.post
        _ = HTTPMethod.put
    }

    func testAllCasesReturnExpectedRawValueValue() {
        XCTAssertEqual(HTTPMethod.get.rawValue, "GET")
        XCTAssertEqual(HTTPMethod.post.rawValue, "POST")
        XCTAssertEqual(HTTPMethod.put.rawValue, "PUT")
    }
}
