//
//  DIContainer.swift

//  Created by Muhammad Hamzah Robbani on 09/06/26.
//

import Foundation

@MainActor 
class DIContainer {
    static let shared = DIContainer()
    

    
    private init() {

    }
    
    
    func makeDataViewModel() -> ContentViewModel {
        return ContentViewModel()
    }
}
