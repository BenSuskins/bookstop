//
//  Item.swift
//  bookstop
//
//  Created by Ben Suskins on 21/10/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
