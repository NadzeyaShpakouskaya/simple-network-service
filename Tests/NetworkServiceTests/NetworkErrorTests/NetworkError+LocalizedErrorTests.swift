import NetworkService
import XCTest

final class NetworkErrorLocalizedErrorTests: XCTestCase {
    func testLocalizedDescriptionReturnsCorrespondingMessageForBadRequestError() {
        let expectedLocalizedDescription = "The server cannot process the request because an error was found in the request. Please check the request and try again."
        let actualLocalizedDescription = NetworkError.badRequest.localizedDescription
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }
    
    func testLocalizedDescriptionReturnsCorrespondingMessageForAuthenticationError() {
        let expectedLocalizedDescription = "The request was not completed. The authentication is required for access."
        let actualLocalizedDescription = NetworkError.authenticationError.localizedDescription
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }
    
    func testLocalizedDescriptionReturnsCorrespondingMessageForClientError() {
        let expectedLocalizedDescription = "The server cannot process the request due to a client error."
        let actualLocalizedDescription = NetworkError.clientError.localizedDescription
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }
    
    func testLocalizedDescriptionReturnsCorrespondingMessageForServerError() {
        let expectedLocalizedDescription = "The server cannot process the request due to a issue with the server."
        let actualLocalizedDescription = NetworkError.serverError.localizedDescription
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }
    
    func testLocalizedDescriptionReturnsCorrespondingMessageForRequestTimeoutError() {
        let expectedLocalizedDescription = "The server timed out waiting for the request. Please try again."
        let actualLocalizedDescription = NetworkError.requestTimeout.localizedDescription
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }
    
    func testLocalizedDescriptionReturnsCorrespondingMessageForUnknownError() {
        let expectedLocalizedDescription = "Unknown error. Please try again."
        let actualLocalizedDescription = NetworkError.unknownError.localizedDescription
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }
}
