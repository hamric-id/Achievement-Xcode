public protocol DataRepositoryProtocol {
    func fetchData() async throws -> [Achievement]
}
