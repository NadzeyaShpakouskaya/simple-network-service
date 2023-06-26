import NetworkService
import XCTest

final class HTTPRequestAllHTTPHeadersTests: XCTestCase {
    override func setUp() async throws {
        try await super.setUp()
        request = HTTPRequest(
            URI: URL(string: "https://www.example.com")!,
            requestMethod: .get
        )
    }

    func testReturnsAddedHeaders() {
        // Given
        let headerNameOne = "A"
        let headerNameTwo = "B"
        let headerValueOne = "a"
        let headerValueTwo = "b"
        let expectedHeaders = [
            headerNameOne.lowercased(): headerValueOne,
            headerNameTwo.lowercased(): headerValueTwo,
        ]

        // When
        request.addValue(headerValueOne, for: headerNameOne)
        request.addValue(headerValueTwo, for: headerNameTwo)

        // Then
        XCTAssertEqual(request.allHTTPHeaders, expectedHeaders)
    }

    func testReturnsEmptyDictionaryIfNoOneHeaderIsAdded() {
        XCTAssertEqual(request.allHTTPHeaders, [:])
    }

    // MARK: - Private interface

    private var request: HTTPRequest!
}
