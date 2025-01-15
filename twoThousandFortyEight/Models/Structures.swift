//
//  Structures.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

import SwiftUI

struct Tile: Equatable, Identifiable {

   static func == (lhs: Tile, rhs: Tile) -> Bool {
        return lhs.value == rhs.value
    }
    
    var value: Int
    var position: Position
    var id = UUID()  // This provides a unique identifier for each tile
}

struct Position: Equatable, Hashable {
    var row: Int
    var col: Int
}

enum Direction {
    case up, down, left, right
}
