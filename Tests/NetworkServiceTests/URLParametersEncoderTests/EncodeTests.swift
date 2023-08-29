import NetworkService
import XCTest

final class EncodeTests: XCTestCase {
    let testURL = Bundle.main.bundleURL
    var request: URLRequest!

    override func setUp() {
        super.setUp()
        request = URLRequest(url: testURL)
    }

    override func tearDown() {
        super.tearDown()
        request = nil
    }

    func testQueryItemsPropertyOfRequestIsNilWhenNilIsPassedAsParameters() throws {
        // Given // When
        URLParametersEncoder.encode(nil, into: &request)
        let actualQueryItems = try queryItems(from: request)

        // Then
        XCTAssertNil(actualQueryItems)
    }

    func testQueryItemsPropertyOfRequestIsEmptyArrayWhenEmptyDictionaryIsPassedAsParameters() throws {
        // Given // When
        URLParametersEncoder.encode([:], into: &request)
        let actualQueryItems = try queryItems(from: request)

        // Then
        XCTAssertEqual(actualQueryItems, [])
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenPassedOneKeyValuePairOfURLParameters() throws {
        // Given
        let urlParameters = ["a": "b"]
        let expectedQueryItems = URLParametersEncoder.queryItems(from: urlParameters)

        // When
        URLParametersEncoder.encode(urlParameters, into: &request)
        let actualQueryItems = try queryItems(from: request)

        // Then
        XCTAssertEqual(actualQueryItems, expectedQueryItems)
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenKeyOfPassedURLParametersIsEmpty() throws {
        // Given
        let urlParameters = ["": "a"]
        let expectedQueryItems = URLParametersEncoder.queryItems(from: urlParameters)

        // When
        URLParametersEncoder.encode(urlParameters, into: &request)
        let actualQueryItems = try queryItems(from: request)

        // Then
        XCTAssertEqual(actualQueryItems, expectedQueryItems)
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenValueOfPassedURLParametersIsEmpty() throws {
        // Given
        let urlParameters = ["a": ""]
        let expectedQueryItems = URLParametersEncoder.queryItems(from: urlParameters)

        // When
        URLParametersEncoder.encode(urlParameters, into: &request)
        let actualQueryItems = try queryItems(from: request)

        // Then
        XCTAssertEqual(actualQueryItems, expectedQueryItems)
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenPassedMultipleParameters() throws {
        // Given
        let urlParameters = [
            "  ": "  ",
            "": "",
            " ": " ",
        ]

        let expectedQueryItems = URLParametersEncoder.queryItems(from: urlParameters)

        // When
        URLParametersEncoder.encode(urlParameters, into: &request)
        let actualQueryItems = try queryItems(from: request)

        // Then
        XCTAssertEqual(actualQueryItems, expectedQueryItems)
    }

    // MARK: - Private interface

    private func queryItems(from request: URLRequest) throws -> [URLQueryItem]? {
        let url = try XCTUnwrap(request.url)
        let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: false))

        return components.queryItems
    }
}
