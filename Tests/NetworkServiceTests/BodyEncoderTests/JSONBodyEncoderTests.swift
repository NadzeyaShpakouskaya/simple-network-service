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
        let addingParameters = ["test": "param"]
        let expectedData = try JSONEncoder().encode(addingParameters)

        try JSONBodyEncoder.encode(addingParameters, into: &request)
        
        let existingBody = request.httpBody
        XCTAssertEqual(expectedData, existingBody)
    }
    
    func testRequestBodyIsNilWhenEncodesMethodCalledWithNilAsBodyParameters() throws {
        try JSONBodyEncoder.encode(nil, into: &request)
        XCTAssertNil(request.httpBody)
    }
}

