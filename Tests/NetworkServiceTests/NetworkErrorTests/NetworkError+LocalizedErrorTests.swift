import NetworkService
import XCTest

final class NetworkErrorLocalizedErrorTests: XCTestCase {
    func testLocalizedDescriptionReturnExpectedString() {
        // Given
        let badRequestDescription = "The server cannot process the request due to an error in the request."
        let badResponseDescription = "The response is invalid or couldn't be parsed."
        let authenticationErrorDescription = """
        The server cannot complete the request.
        It lacks valid authentication credentials for the requested resource.
        """
        let clientErrorDescription = "The server cannot process the request due to a client error."
        let serverErrorDescription = "The server cannot process the request due to a issue with the server."
        let requestTimeoutDescription = "The server timed out waiting for the request." // TODO: response?
        let unknownErrorDescription = "Unknown error."

        // When // Then
        XCTAssertEqual(NetworkError.badRequest.localizedDescription, badRequestDescription)
        XCTAssertEqual(NetworkError.badResponse.localizedDescription, badResponseDescription)
        XCTAssertEqual(NetworkError.authenticationError.localizedDescription, authenticationErrorDescription)
        XCTAssertEqual(NetworkError.clientError.localizedDescription, clientErrorDescription)
        XCTAssertEqual(NetworkError.serverError.localizedDescription, serverErrorDescription)
        XCTAssertEqual(NetworkError.requestTimeout.localizedDescription, requestTimeoutDescription)
        XCTAssertEqual(NetworkError.unknownError.localizedDescription, unknownErrorDescription)
    }
}
