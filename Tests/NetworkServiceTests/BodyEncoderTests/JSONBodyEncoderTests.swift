import NetworkService
import XCTest

final class JSONBodyEncoderTests: XCTestCase {
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

    func testEncodeExistsInAPI() throws {
        XCTAssertNoThrow(try JSONBodyEncoder.encode(nil, into: &request))
    }

    func testEncodeAddedExpectedBodyParameters() throws {
        // Given
        let addingParameters = ["test": "param"]
        let expectedData = try JSONEncoder().encode(addingParameters)

        // When
        try JSONBodyEncoder.encode(addingParameters, into: &request)

        // Then
        XCTAssertEqual(expectedData, request.httpBody)
    }

    func testRequestBodyIsNilWhenEncodesMethodCalledWithNilAsBodyParameters() throws {
        // Given // When
        try JSONBodyEncoder.encode(nil, into: &request)

        // Then
        XCTAssertNil(request.httpBody)
    }
}
