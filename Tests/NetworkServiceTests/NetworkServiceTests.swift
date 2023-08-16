@testable import NetworkService
import XCTest

final class NetworkServiceTests: XCTestCase {
    struct MockEndpoint: HTTPAPIEndpoint {
        static var networkEnvironment: String = "test"
        var baseURL: URL = URL(string: "https://api.example.com")!
        var path: String = "/endpoint"
        var task: HTTPTask = .request
        var method: HTTPMethod = .get
        var headers: HTTPHeaders = [:]
    }
    
    // MARK: - Tests
    var networkService: NetworkService<MockEndpoint>!
        
        override func setUpWithError() throws {
            networkService = NetworkService()
            URLProtocol.registerClass(MockURLProtocol.self)
        }

        override func tearDownWithError() throws {
            URLProtocol.unregisterClass(MockURLProtocol.self)
            networkService = nil
        }
        
        func testSuccessfulRequest() async throws {
            // Given
            let expectedData = "Mocked Response Data".data(using: .utf8)!
            MockURLProtocol.requestHandler = { request in
                let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
                return (response, expectedData)
            }
            
            let endpoint = MockEndpoint()
            
            // When
            let result = await networkService.request(endpoint)
            
            // Then
            switch result {
            case .success(let data):
                XCTAssertEqual(data, expectedData)
            case .failure(let error):
                XCTFail("Expected success, but got failure: \(error)")
            }
        }
        
        func testBadRequest() async throws {
            // Given
            MockURLProtocol.requestHandler = { request in
                let response = HTTPURLResponse(url: request.url!, statusCode: 400, httpVersion: nil, headerFields: nil)!
                return (response, Data())
            }
            
            let endpoint = MockEndpoint()
            
            // When
            let result = await networkService.request(endpoint)
            
            // Then
            switch result {
            case .success:
                XCTFail("Expected failure, but got success")
            case .failure(let error):
                XCTAssertEqual(error as? NetworkError, .badRequest)
            }
        }

    }


// MARK: - MockURLProtocol

class MockURLProtocol: URLProtocol {
    
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            fatalError("MockURLProtocol.requestHandler is not set.")
        }
        
        do {
            let (response, data) = try handler(request)
            
            if let data = data {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
                client?.urlProtocol(self, didLoad: data)
            }
            
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {
    }
}
