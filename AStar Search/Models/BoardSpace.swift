//
//  BoardSpace.swift
//  AStar Search
//
//  Created by Eli Hartnett on 9/1/22.
//

import Foundation
import SwiftUI

class BoardSpace: Comparable, ObservableObject {
    var id = UUID()
    let gridPoint: GridPoint
    var type: SpaceType
    var priority: Double
    var closed = false
    var open = false
    @Published var highlighted = false
    
    init(gridPoint: GridPoint, type: SpaceType, priority: Double = 0) {
        self.gridPoint = gridPoint
        self.type = type
        self.priority = priority
    }
    
    static func < (lhs: BoardSpace, rhs: BoardSpace) -> Bool {
        return lhs.priority  < rhs.priority
    }
    
    static func == (lhs: BoardSpace, rhs: BoardSpace) -> Bool {
        lhs.id == rhs.id
    }
}

struct GridPoint: Equatable {
    var x: Int
    var y: Int
}
