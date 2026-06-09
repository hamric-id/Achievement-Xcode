//
//  Achievement.swift

//  Created by Muhammad Hamzah Robbani on 09/06/26.
//

import Foundation


public struct Achievement: Codable, Identifiable{
    public let id = UUID()
    public let label: String
    public let type: String
    public let minimumTarget: UInt
    public let currentTarget: UInt
    public let target: UInt
    
    public init(label: String, type: String,  minimumTarget: UInt, currentTarget: UInt, target: UInt) {
        self.label = label
        self.type = type
        self.target = target
        self.currentTarget = currentTarget
        self.minimumTarget = minimumTarget
    }
}
