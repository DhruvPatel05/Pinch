//
//  Item.swift
//  Pinch
//
//  Created by Dhruv Patel on 18/06/26.
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
