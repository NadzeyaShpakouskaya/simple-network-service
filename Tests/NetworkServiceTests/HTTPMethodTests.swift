import NetworkService
import XCTest

final class HTTPMethodTests: XCTestCase {
    func testExpectedHTTPMethodsEqualToIncludedInAllCases() {
        // Given
        let currentHTTPMethods = Set(HTTPMethod.allCases)
        let expectedHTTPMethods: Set<HTTPMethod> = [
            HTTPMethod.get,
            HTTPMethod.post,
            HTTPMethod.put,
        ]

        // When // Then
        XCTAssertEqual(currentHTTPMethods, expectedHTTPMethods)
    }

    func testAllCasesReturnExpectedRawValue() {
        XCTAssertEqual(HTTPMethod.get.rawValue, "GET")
        XCTAssertEqual(HTTPMethod.post.rawValue, "POST")
        XCTAssertEqual(HTTPMethod.put.rawValue, "PUT")
    }
}
