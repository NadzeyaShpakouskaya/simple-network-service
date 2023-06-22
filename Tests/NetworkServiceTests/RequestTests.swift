import NetworkService
import XCTest

final class HTTPRequestTests: XCTestCase {
    func testHTTPRequestsPropertiesContainValuesPassedToInit() {
        // Given
        let url = URL(string: "https://www.example.com")!
        let httpMethod = HTTPMethod.get
        let httpHeaders: HTTPRequest.HTTPHeaders = ["a": "b"]
        let body = ""

        // When
        let requestWithBody = HTTPRequest(
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
        let httpHeaders: HTTPRequest.HTTPHeaders = ["a": "b"]

        // When
        let requestWithoutBody = HTTPRequest(
            URI: url,
            requestMethod: httpMethod,
            headers: httpHeaders
        )

        // Then
        XCTAssertNil(requestWithoutBody.body)
    }
}
