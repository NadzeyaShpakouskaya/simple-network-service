import NetworkService
import XCTest

final class NetworkErrorLocalizedErrorTests: XCTestCase {
    func testLocalizedDescriptionReturnsCorrespondingMessageForBadRequestError() {
        // Given
        let expectedLocalizedDescription = "The server cannot process the request due to an error in the request."
        let actualLocalizedDescription = NetworkError.badRequest.localizedDescription
        
        // When // Then
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }

    func testLocalizedDescriptionReturnsCorrespondingMessageForAuthenticationError() {
        // Given
        let expectedLocalizedDescription = """
            The server cannot complete the request.
            It lacks valid authentication credentials for the requested resource.
            """
        let actualLocalizedDescription = NetworkError.authenticationError.localizedDescription
        
        // When // Then
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }

    func testLocalizedDescriptionReturnsCorrespondingMessageForClientError() {
        // Given
        let expectedLocalizedDescription = "The server cannot process the request due to a client error."
        let actualLocalizedDescription = NetworkError.clientError.localizedDescription
        
        // When // Then
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }

    func testLocalizedDescriptionReturnsCorrespondingMessageForServerError() {
        // Given
        let expectedLocalizedDescription = "The server cannot process the request due to a issue with the server."
        let actualLocalizedDescription = NetworkError.serverError.localizedDescription
        
        // When // Then
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }

    func testLocalizedDescriptionReturnsCorrespondingMessageForRequestTimeoutError() {
        // Given
        let expectedLocalizedDescription = "The server timed out waiting for the request."
        let actualLocalizedDescription = NetworkError.requestTimeout.localizedDescription
        
        // When // Then
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }

    func testLocalizedDescriptionReturnsCorrespondingMessageForUnknownError() {
        // Given
        let expectedLocalizedDescription = "Unknown error."
        let actualLocalizedDescription = NetworkError.unknownError.localizedDescription
        
        // When // Then
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }
}
