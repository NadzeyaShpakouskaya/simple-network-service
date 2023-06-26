import NetworkService
import XCTest

final class HTTPRequestSetValueTests: XCTestCase {
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
        request.setValue(headerValue, for: headerName)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, [headerName: headerValue])
    }

    func testCreatesNewHeaderWhenTheHeaderValueIsEmptyString() {
        // Given
        let headerName = "A"
        let headerValue = ""

        // When
        request.setValue(headerValue, for: headerName)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, [headerName: headerValue])
    }

    func testCreatesNewHeaderWhenTheHeaderValueIsSpace() {
        // Given
        let headerName = "A"
        let headerValue = " "

        // When
        request.setValue(headerValue, for: headerName)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, [headerName: headerValue])
    }

    func testOverridesThePreviousHeaderValue() {
        // Given
        let headerName = "A"
        let initialHeaderValue = "B"
        let overridingHeaderValue = "C"
        request.addValue(initialHeaderValue, for: headerName)

        // When
        request.setValue(overridingHeaderValue, for: headerName)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, [headerName: overridingHeaderValue])
    }

    func testDeletesHeaderIfTheSetHeaderValueIsNil() {
        // Given
        let headerName = "A"
        let initialHeaderValue = "B"
        request.addValue(initialHeaderValue, for: headerName)

        // When
        request.setValue(nil, for: headerName)

        // Then
        XCTAssertNil(request.value(for: headerName))
    }

    // MARK: - Private interface

    private var request: HTTPRequest!
}
