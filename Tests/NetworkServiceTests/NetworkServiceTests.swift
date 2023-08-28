@testable import NetworkService
import XCTest

final class NetworkServiceTests: XCTestCase {
    struct MockEndpoint: HTTPAPIEndpoint {
        static var networkEnvironment: String = "test"
        var baseURL: URL = .init(string: "https://api.example.com")!
        var path: String = "/endpoint"
        var task: HTTPTask = .request
        var method: HTTPMethod = .get
        var headers: HTTPHeaders = [:]
    }

    var networkService: NetworkService<MockEndpoint>!

    override func setUpWithError() throws {
        networkService = NetworkService()
        URLProtocol.registerClass(MockURLProtocol.self)
    }

    override func tearDownWithError() throws {
        URLProtocol.unregisterClass(MockURLProtocol.self)
        networkService = nil
    }

    func testSuccessfulRequestReturnsExpectedData() async throws {
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
        case let .success(data):
            XCTAssertEqual(data, expectedData)
        case let .failure(error):
            XCTFail("Expected success, but got failure: \(error)")
        }
    }

    func testBadRequestReturnsFailure() async throws {
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
        case let .failure(error):
            XCTAssertEqual(error as? NetworkError, .badRequest)
        }
    }

    func testRequestWithURLParametersReturnsExpectedData() async throws {
        // Given
        let expectedData = "Mocked Response Data with URL Parameters".data(using: .utf8)!
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, expectedData)
        }

        var endpoint = MockEndpoint()
        endpoint.task = .requestWithURLParameters(urlParameters: ["key": "value"])

        // When
        let result = await networkService.request(endpoint)

        // Then
        switch result {
        case let .success(data):
            XCTAssertEqual(data, expectedData)
        case let .failure(error):
            XCTFail("Expected success, but got failure: \(error)")
        }
    }

    func testRequestWithBodyParametersReturnsExpectedData() async throws {
        // Given
        let expectedData = "Mocked Response Data with Body Parameters".data(using: .utf8)!
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, expectedData)
        }

        var endpoint = MockEndpoint()
        endpoint.task = .requestWithBodyParameters(bodyParameters: ["key": "value"])

        // When
        let result = await networkService.request(endpoint)

        // Then
        switch result {
        case let .success(data):
            XCTAssertEqual(data, expectedData)
        case let .failure(error):
            XCTFail("Expected success, but got failure: \(error)")
        }
    }
}
