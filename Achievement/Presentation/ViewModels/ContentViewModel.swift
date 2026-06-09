//
//  ContentViewModel.swift

//  Created by Muhammad Hamzah Robbani on 09/06/26.
//


import SwiftUI

@MainActor
class ContentViewModel: ObservableObject {
    @Published var searchText: String = ""
    var hasResults: Bool {
        !filteredItems.isEmpty
    }
    var emptyStateMessage: String {
        searchText.isEmpty ? "No achievements" : "No results for '\(searchText)'"
    }

    
    @Published var items: [Achievement] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    var filteredItems: [Achievement] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { item in
                item.label.localizedCaseInsensitiveContains(searchText) ||
                item.type.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    private let fetchDataUseCase: FetchDataUseCaseProtocol

    init(fetchDataUseCase: FetchDataUseCaseProtocol) {
        self.fetchDataUseCase = fetchDataUseCase
    }
    
    func fetchData() async {
        isLoading = true
        errorMessage = nil
        
        do {
            items = try await fetchDataUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
