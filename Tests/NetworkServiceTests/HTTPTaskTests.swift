import NetworkService
import XCTest

final class HTTPTaskTests: XCTestCase {
    func testHTTPTaskCasesPresentInAPI() {
        _ = HTTPTask.request
        _ = HTTPTask.requestWithURLParameters(urlParameters: nil)
        _ = HTTPTask.requestWithBodyParameters(bodyParameters: nil)
    }

    func testCreatesHTTPTaskWithEmptyURLParameters() {
        // Given
        let emptyUrlParameters = HTTPTask.URLParameters()

        // When
        let task = HTTPTask.requestWithURLParameters(urlParameters: emptyUrlParameters)

        // Then
        XCTAssertNotNil(task)
    }

    func testCreatesHTTPTaskWithNilAsURLParameters() {
        // Given
        let nilUrlParameters: HTTPTask.URLParameters? = nil

        // When
        let task = HTTPTask.requestWithURLParameters(urlParameters: nilUrlParameters)

        // Then
        XCTAssertNotNil(task)
    }

    func testCreatesHTTPTaskWithEmptyKeyInURLParameters() {
        // Given
        let urlParametersWithEmptyKey = ["": "a"]

        // When
        let task = HTTPTask.requestWithURLParameters(urlParameters: urlParametersWithEmptyKey)

        // Then
        XCTAssertNotNil(task)
    }

    func testCreatesHTTPTaskWithEmptyValueInURLParameters() {
        // Given
        let urlParametersWithEmptyValue = ["a": ""]

        // When
        let task = HTTPTask.requestWithURLParameters(urlParameters: urlParametersWithEmptyValue)

        // Then
        XCTAssertNotNil(task)
    }

    func testCreatesHTTPTaskWithEmptyKeyAndValueInURLParameters() {
        // Given
        let urlParametersWithEmptyKeyAndValue = ["": ""]

        // When
        let task = HTTPTask.requestWithURLParameters(urlParameters: urlParametersWithEmptyKeyAndValue)

        // Then
        XCTAssertNotNil(task)
    }

    func testCreatesHTTPTaskWithMultipleURLParameters() {
        // Given
        let urlParameters = [
            "a": "a",
            "b": "a",
        ]

        // When
        let task = HTTPTask.requestWithURLParameters(urlParameters: urlParameters)

        // Then
        XCTAssertNotNil(task)
    }

    func testCreatesHTTPTaskWithEmptyBodyParameters() {
        // Given
        let emptyBodyParameters = HTTPTask.BodyParameters()

        // When
        let task = HTTPTask.requestWithBodyParameters(bodyParameters: emptyBodyParameters)

        // Then
        XCTAssertNotNil(task)
    }

    func testCreatesHTTPTaskWithNilAsBodyParameters() {
        // Given
        let nilBodyParameters: HTTPTask.BodyParameters? = nil

        // When
        let task = HTTPTask.requestWithBodyParameters(bodyParameters: nilBodyParameters)

        // Then
        XCTAssertNotNil(task)
    }

    func testCreatesHTTPTaskWithEmptyKeyInBodyParameters() {
        // Given
        let bodyParametersWithEmptyKey = ["": 0]

        // When
        let task = HTTPTask.requestWithBodyParameters(bodyParameters: bodyParametersWithEmptyKey)

        // Then
        XCTAssertNotNil(task)
    }

    func testCreatesHTTPTaskWithMultipleBodyParameters() {
        // Given
        let BodyParameters: [String: Any] = [
            "a": 0,
            "b": "a",
            "c": 0.0,
        ]

        // When
        let task = HTTPTask.requestWithBodyParameters(bodyParameters: BodyParameters)

        // Then
        XCTAssertNotNil(task)
    }
}
