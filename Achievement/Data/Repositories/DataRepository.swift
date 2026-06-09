
//
//  DataRepostory.swift

//  Created by Muhammad Hamzah Robbani on 09/06/26.
//

import Foundation

class DataRepository: DataRepositoryProtocol {
    private let apiClient: APIClientProtocol
    private let endpoint = "https://mocki.io/v1/d1a07038-ae20-414c-b976-7c6bde805680"
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchData() async throws -> [Achievement] {
        let response: APIResponseDTO = try await apiClient.request(endpoint, method: .get, body: nil)
//        return response.data
        return response.data.map { dto in
            Achievement(
                label: dto.label,
                type: dto.type,
                minimumTarget: UInt(dto.minimumTarget),
                currentTarget: UInt(dto.currentValue),
                target: UInt(dto.target)
            )
        }
    }
}
