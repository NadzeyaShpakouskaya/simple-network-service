import NetworkService
import XCTest

final class HTTPRequestInitTests: XCTestCase {
    func testCreatesNewInstanceWithExpectedPropertyValues() {
        // Given
        let url = URL(string: "https://www.example.com")!
        let httpMethod = HTTPMethod.post
        let body = ""

        // When
        let requestWithoutBody = HTTPRequest(
            URI: url,
            requestMethod: httpMethod
        )
        let requestWithBody = HTTPRequest(
            URI: url,
            requestMethod: httpMethod,
            body: body
        )

        // Then
        XCTAssertEqual(requestWithoutBody.URI, url)
        XCTAssertEqual(requestWithoutBody.requestMethod, httpMethod)
        XCTAssertEqual(requestWithoutBody.allHTTPHeaders, [:])
        XCTAssertNil(requestWithoutBody.body)

        XCTAssertEqual(requestWithBody.URI, url)
        XCTAssertEqual(requestWithBody.requestMethod, httpMethod)
        XCTAssertEqual(requestWithBody.allHTTPHeaders, [:])
        XCTAssertEqual(requestWithBody.body, body)
    }

    func testNewInstanceHasNilBodyIfHTTPMethodIsGetAndBodyIsPassed() {
        // Given
        let url = URL(string: "https://www.example.com")!
        let httpMethod = HTTPMethod.get
        let body = ""

        // When
        let requestWithBody = HTTPRequest(
            URI: url,
            requestMethod: httpMethod,
            body: body
        )

        // Then
        XCTAssertNil(requestWithBody.body)
    }
}
