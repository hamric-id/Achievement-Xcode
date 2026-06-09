//
//  ContentView.swift

//  Created by Muhammad Hamzah Robbani on 03/06/26.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel: ContentViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: DIContainer.shared.makeDataViewModel())
    }

    var body: some View {
        NavigationView {
            HStack{
                Group {
                    if viewModel.isLoading {
                        ProgressView("Loading data...")
                    } else if let error = viewModel.errorMessage {
                        errorView(error)
                    } else {
                        mainContent
                    }
                }
                .navigationTitle("Dashboard")
                .refreshable {
                    //must be fecth data in viewmodel
                }
            }
            
        }
        .task {
            //must be fecth data in viewmodel
        }
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if !viewModel.hasResults && viewModel.searchText.isEmpty {
            emptyView
        }else{
            List {
                ForEach(viewModel.filteredItems) { item in
                    CardView(item: item) {
                        print("Detail tapped for: \(item.type)")
                    }
                }
                
                if !viewModel.hasResults && !viewModel.searchText.isEmpty {
                    notFoundView
                }
            }
            .listStyle(.plain)
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Cari achievement..."
            )
        }
    }
    
    private func errorView(_ error: String) -> some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundColor(.orange)
            Text(error)
                .multilineTextAlignment(.center)
            Button("Retry") {
                //must be fecth data in viewmodel
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    private var notFoundView: some View {
        ContentUnavailableView(
            viewModel.emptyStateMessage,
            systemImage: "magnifyingglass",
            description: Text("Try searching with different keywords")
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var emptyView: some View {
        ContentUnavailableView(
            viewModel.emptyStateMessage,
            systemImage: "magnifyingglass",
            description: Text("No Achievement Available")
        ).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
