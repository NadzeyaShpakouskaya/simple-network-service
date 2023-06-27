import NetworkService

extension HTTPMethod: CaseIterable {
    public static var allCases: [HTTPMethod] {
        [.get,
         .post,
         .put,
        ]
    }
}
