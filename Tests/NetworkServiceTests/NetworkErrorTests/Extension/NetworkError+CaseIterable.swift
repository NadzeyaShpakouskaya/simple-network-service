import NetworkService

extension NetworkError: CaseIterable {
    public static var allCases: [NetworkError] {
        [.badRequest,
         .authenticationError,
         .clientError,
         .serverError,
         .requestTimeout,
         .unknownError]
    }
}
