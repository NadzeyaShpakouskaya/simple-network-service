import NetworkService
import XCTest

final class HTTPRequestValueForHeaderNameTests: XCTestCase {
    override func setUp() async throws {
        try await super.setUp()
        request = HTTPRequest(
            URI: URL(string: "https://www.example.com")!,
            requestMethod: .post
        )
    }

    func testReturnsNilIfNoCorrespondingHeaderField() {
        // Given
        let headerName = "a"

        // When
        let headerValue = request.value(for: headerName)

        // Then
        XCTAssertNil(headerValue)
    }

    func testReturnsCorrespondingHeaderValue() {
        // Given
        let headerNameOne = "a"
        let headerNameTwo = "b"
        let headerValueOne = "A"
        let headerValueTwo = "B"
        request.setValue(headerValueOne, for: headerNameOne)
        request.setValue(headerValueTwo, for: headerNameTwo)

        // When
        let expectedHeaderValueOne = request.value(for: headerNameOne)
        let expectedHeaderValueTwo = request.value(for: headerNameTwo)

        // Then
        XCTAssertEqual(expectedHeaderValueOne, headerValueOne)
        XCTAssertEqual(expectedHeaderValueTwo, headerValueTwo)
    }

    // MARK: - Private interface

    private var request: HTTPRequest!
}
