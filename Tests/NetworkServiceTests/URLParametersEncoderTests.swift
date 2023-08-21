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
        // Given // When
        URLParametersEncoder.encode(nil, into: &request)
        let urlComponents = try XCTUnwrap(URLComponents(url: request.url!, resolvingAgainstBaseURL: false))
        let encodedQueryItems = urlComponents.queryItems

        // Then
        XCTAssertNil(encodedQueryItems)
    }

    func testQueryItemsPropertyOfRequestIsEmptyArrayWhenEmptyDictionaryIsPassedAsParameters() throws {
        // Given
        let parameters = [String: String]()

        // When
        URLParametersEncoder.encode(parameters, into: &request)
        let urlComponents = try XCTUnwrap(URLComponents(url: request.url!, resolvingAgainstBaseURL: false))
        let encodedQueryItems = urlComponents.queryItems

        // Then
        XCTAssertEqual(encodedQueryItems, [])
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenPassedOneKeyValuePairOfURLParameters() throws {
        // Given
        let parameters = ["a": "b"]
        let passedQueryItems = try XCTUnwrap(queryItems(from: parameters))

        // When
        URLParametersEncoder.encode(parameters, into: &request)
        let components = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)
        let encodedQueryItems = try XCTUnwrap(components?.queryItems)

        // Then
        XCTAssertEqual(Set(passedQueryItems), Set(encodedQueryItems))
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenKeyOfPassedURLParametersIsEmpty() throws {
        // Given
        let parameters = ["": "a"]
        let passedQueryItems = try XCTUnwrap(queryItems(from: parameters))

        // When
        URLParametersEncoder.encode(parameters, into: &request)
        let components = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)
        let encodedQueryItems = try XCTUnwrap(components?.queryItems)

        // Then
        XCTAssertEqual(Set(passedQueryItems), Set(encodedQueryItems))
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenValueOfPassedURLParametersIsEmpty() throws {
        // Given
        let parameters = ["a": ""]
        let passedQueryItems = try XCTUnwrap(queryItems(from: parameters))

        // When
        URLParametersEncoder.encode(parameters, into: &request)
        let components = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)
        let encodedQueryItems = try XCTUnwrap(components?.queryItems)

        // Then
        XCTAssertEqual(Set(passedQueryItems), Set(encodedQueryItems))
    }

    func testQueryItemsPropertyOfRequestHasExpectedValueWhenPassedMultipleParametersContainEmptyStrings() throws {
        // Given
        let parameters = [
            "  ": "  ",
            "": "",
            " ": " ",
        ]
        let passedQueryItems = try XCTUnwrap(queryItems(from: parameters))

        // When
        URLParametersEncoder.encode(parameters, into: &request)
        let components = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)
        let encodedQueryItems = try XCTUnwrap(components?.queryItems)

        // Then
        XCTAssertEqual(Set(passedQueryItems), Set(encodedQueryItems))
    }

    // MARK: - Private interface

    private func queryItems(from parameters: [String: String]) -> [URLQueryItem] {
        parameters.map { key, value in
            URLQueryItem(name: key, value: value)
        }
    }
}
