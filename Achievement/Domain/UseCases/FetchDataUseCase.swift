
import Foundation

protocol FetchDataUseCaseProtocol {
    func execute() async throws -> [Achievement]
}

class FetchDataUseCase: FetchDataUseCaseProtocol {
    private let repository: DataRepositoryProtocol
    
    init(repository: DataRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Achievement] {
        return try await repository.fetchData()
    }
}
