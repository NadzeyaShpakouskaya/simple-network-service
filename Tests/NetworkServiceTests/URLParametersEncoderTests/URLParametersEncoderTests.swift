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
        URLParametersEncoder.encode(parameters, into: &request)
        let components = try XCTUnwrap(URLComponents(url: request.url!, resolvingAgainstBaseURL: false))
        let actualQueryItems = components.queryItems

        if let parameters {
            let expectedQueryItems = URLParametersEncoder.queryItems(from: parameters)
            XCTAssertEqual(actualQueryItems, expectedQueryItems)
        } else {
            XCTAssertNil(actualQueryItems)
        }
    }
}
