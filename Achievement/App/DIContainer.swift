//
//  DIContainer.swift

//  Created by Muhammad Hamzah Robbani on 09/06/26.
//

import Foundation

@MainActor 
class DIContainer {
    static let shared = DIContainer()
    
    private let apiClient: APIClientProtocol
    
    private let repository: DataRepositoryProtocol
    private let fetchDataUseCase: FetchDataUseCaseProtocol
    
    
    private init() {
        self.apiClient = APIClient()
        
        self.repository = DataRepository(apiClient: apiClient)
        self.fetchDataUseCase = FetchDataUseCase(repository: repository)
        
    }
    
    
    func makeDataViewModel() -> ContentViewModel {
        return ContentViewModel(fetchDataUseCase: fetchDataUseCase)
    }
}
