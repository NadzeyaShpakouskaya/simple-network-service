import NetworkService
import XCTest

final class QueryItemsTests: XCTestCase {
    func testReturnsQueryItemWithExpectedNameAndValue() {
        // Given
        let urlParameters = ["a": "a"]
        let expectedQueryItems = [URLQueryItem(name: "a", value: "a")]

        // When
        let actualQueryItems = URLParametersEncoder.queryItems(from: urlParameters)

        // Then
        XCTAssertEqual(actualQueryItems, expectedQueryItems)
    }

    func testReturnsEmptyArrayWhenPassedEmptyDictionaryOfURLParameter() {
        // Given // When
        let actualQueryItems = URLParametersEncoder.queryItems(from: URLParameters())
        // Then
        XCTAssertEqual(actualQueryItems, [])
    }

    func testReturnsQueryItemWithExpectedNameAndValueWhenPassedURLParameterHasEmptyKeyAndValue() {
        // Given
        let urlParameters = ["": ""]
        let expectedQueryItems = [URLQueryItem(name: "", value: "")]

        // When
        let actualQueryItems = URLParametersEncoder.queryItems(from: urlParameters)

        // Then
        XCTAssertEqual(actualQueryItems, expectedQueryItems)
    }

    func testReturnsQueryItemWithExpectedNameAndValueWhenPassedURLParameterHasSpaceInKeyAndInValue() {
        // Given
        let urlParameters = [" ": " "]
        let expectedQueryItems = [URLQueryItem(name: " ", value: " ")]

        // When
        let actualQueryItems = URLParametersEncoder.queryItems(from: urlParameters)

        // Then
        XCTAssertEqual(actualQueryItems, expectedQueryItems)
    }

    func testReturnsAmountOfQueryItemsThatEqualsToAmountOfURLParameters() throws {
        // Given
        let twoUrlParameters = [
            "": "",
            " ": " ",
        ]
        let threeUrlParameters = [
            "": "",
            " ": " ",
            "a": "a",
        ]

        // When
        let queryItemsCountForTwoUrlParameters = URLParametersEncoder.queryItems(from: twoUrlParameters).count
        let queryItemsCountForThreeUrlParameters = URLParametersEncoder.queryItems(from: threeUrlParameters).count

        // Then
        XCTAssertEqual(queryItemsCountForTwoUrlParameters, 2)
        XCTAssertEqual(queryItemsCountForThreeUrlParameters, 3)
    }
}
