import NetworkService
import XCTest

final class URLParametersEncoderTests: XCTestCase {
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
        try assertQueryItemsEquality(parameters: nil)
    }

    func testQueryItemsPropertyOfRequestIsEmptyArrayWhenEmptyDictionaryIsPassedAsParameters() throws {
        try assertQueryItemsEquality(parameters: [:])
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenPassedOneKeyValuePairOfURLParameters() throws {
        try assertQueryItemsEquality(parameters: ["a": "b"])
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenKeyOfPassedURLParametersIsEmpty() throws {
        try assertQueryItemsEquality(parameters: ["": "a"])
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenValueOfPassedURLParametersIsEmpty() throws {
        try assertQueryItemsEquality(parameters: ["a": ""])
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenPassedMultipleParameters() throws {
        // Given
        let parameters = [
            "  ": "  ",
            "": "",
            " ": " ",
        ]

        // When // Then
        try assertQueryItemsEquality(parameters: parameters)
    }

    // MARK: - Private interface

    private func assertQueryItemsEquality(parameters: URLParameters?) throws {
        let expectedQueryItems = queryItems(from: parameters)

        URLParametersEncoder.encode(parameters, into: &request)
        let components = try XCTUnwrap(URLComponents(url: request.url!, resolvingAgainstBaseURL: false))
        let actualQueryItems = components.queryItems

        XCTAssertEqual(actualQueryItems, expectedQueryItems)
    }

    private func queryItems(from parameters: URLParameters?) -> [URLQueryItem]? {
        guard let parameters else { return nil }
        return parameters.map { key, value in
            URLQueryItem(name: key, value: value)
        }
    }
}
