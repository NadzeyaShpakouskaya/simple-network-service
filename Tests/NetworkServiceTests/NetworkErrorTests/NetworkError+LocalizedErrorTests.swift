import NetworkService
import XCTest

final class NetworkErrorLocalizedErrorTests: XCTestCase {
    func testLocalizedDescriptionReturnsCorrespondingMessageForBadRequestError() {
        let expectedLocalizedDescription = "The server cannot process the request due to an error in the request."
        let actualLocalizedDescription = NetworkError.badRequest.localizedDescription
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }

    func testLocalizedDescriptionReturnsCorrespondingMessageForAuthenticationError() {
        let expectedLocalizedDescription = """
            The server cannot complete the request.
            It lacks valid authentication credentials for the requested resource.
            """
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
        let expectedLocalizedDescription = "The server timed out waiting for the request."
        let actualLocalizedDescription = NetworkError.requestTimeout.localizedDescription
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }

    func testLocalizedDescriptionReturnsCorrespondingMessageForUnknownError() {
        let expectedLocalizedDescription = "Unknown error."
        let actualLocalizedDescription = NetworkError.unknownError.localizedDescription
        XCTAssertEqual(expectedLocalizedDescription, actualLocalizedDescription)
    }
}
