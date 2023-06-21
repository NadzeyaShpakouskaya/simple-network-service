import NetworkService
import XCTest

final class RequestTests: XCTestCase {
    func testRequestsPropertiesContainValuesPassedToInit() {
        // Given
        let url = URL(string: "https://www.example.com")!
        let httpMethod = HTTPMethod.get
        let httpHeaders: Request.HTTPHeaders = ["a": "b"]
        let body = ""

        // When
        let requestWithBody = Request(
            URI: url,
            requestMethod: httpMethod,
            headers: httpHeaders,
            body: body
        )

        // Then
        XCTAssertEqual(requestWithBody.URI, url)
        XCTAssertEqual(requestWithBody.requestMethod, httpMethod)
        XCTAssertEqual(requestWithBody.headers, httpHeaders)
        XCTAssertEqual(requestWithBody.body, body)
    }

    func testBodyPropertyContainsNilWhenBodyWasNotPassedToInit() {
        // Given
        let url = URL(string: "https://www.example.com")!
        let httpMethod = HTTPMethod.get
        let httpHeaders: Request.HTTPHeaders = ["a": "b"]

        // When
        let requestWithoutBody = Request(
            URI: url,
            requestMethod: httpMethod,
            headers: httpHeaders
        )

        // Then
        XCTAssertNil(requestWithoutBody.body)
    }
}
