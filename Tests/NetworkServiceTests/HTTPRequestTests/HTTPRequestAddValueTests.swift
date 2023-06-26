import NetworkService
import XCTest

final class HTTPRequestAddValueTests: XCTestCase {
    override func setUp() async throws {
        try await super.setUp()
        request = HTTPRequest(
            URI: URL(string: "https://www.example.com")!,
            requestMethod: .post
        )
    }

    func testCreatesNewHeaderWhenAllHeadersIsEmpty() {
        // Given
        let headerName = "A"
        let headerValue = "B"

        // When
        request.addValue(headerValue, for: headerName)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, [headerName: headerValue])
    }

    func testAddsNewHeaderValueWhenTheHeaderValueIsEmptyString() {
        // Given
        let headerName = "A"
        let headerValue = ""

        // When
        request.addValue(headerValue, for: headerName)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, [headerName: headerValue])
    }

    func testAddsNewHeaderValueWhenTheHeaderValueIsSpace() {
        // Given
        let headerName = "A"
        let headerValue = " "

        // When
        request.addValue(headerValue, for: headerName)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, [headerName: headerValue])
    }
    
    func testAddsNewHeaderValueWhenTheHeaderNameIsEmptyString() {
        // Given
        let headerName = ""
        let headerValue = "A"

        // When
        request.addValue(headerValue, for: headerName)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, [headerName: headerValue])
    }

    func testAddsNewHeaderValueWhenAllHeadersContainSuchHeader() {
        // Given
        let headerName = "A"
        let headerValueOne = "B"
        let headerValueTwo = "C"
        let expectedHeaderValue = "B,C"
        request.addValue(headerValueOne, for: headerName)

        // When
        request.addValue(headerValueTwo, for: headerName)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, [headerName: expectedHeaderValue])
    }

    func testAddsEmptyStringAndSpaceToHeaderValue() {
        // Given
        let headerName = "A"
        let headerValueOne = " "
        let headerValueTwo = ""
        let expectedHeaderValue = " ,"

        // When
        request.addValue(headerValueOne, for: headerName)
        request.addValue(headerValueTwo, for: headerName)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, [headerName: expectedHeaderValue])
    }

    // MARK: - Private interface

    private var request: HTTPRequest!
}
