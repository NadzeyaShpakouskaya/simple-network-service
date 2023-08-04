import NetworkService
import XCTest

final class JSONBodyEncoderTests: XCTestCase {
    var request: URLRequest!
    
    override func setUpWithError() throws {
        guard let testURL = URL(string: "https://www.google.com/") else { throw TestError.invalidURL }
        request = URLRequest(url: testURL)
        request.httpMethod = "POST"
    }
    
    override func tearDownWithError() throws {
        request = nil
    }
    
    
    
    func testEncodeExistsInAPI() throws {
        XCTAssertNoThrow(try JSONBodyEncoder.encode(nil, into: &request))
    }
    
    func testEncodeAddedExpectedBodyParameters() throws {
        let addingParameters = ["test": "param"]
        let expectedData = try JSONSerialization.data(withJSONObject: addingParameters)

        try JSONBodyEncoder.encode(addingParameters, into: &request)
        
        let existingBody = request.httpBody
        XCTAssertEqual(expectedData, existingBody)
    }
    
}

enum TestError: Error {
    case invalidURL
}
