//
//  RotateTable.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

extension GameViewModel {
    
    func rotateLeft() {
        tiles = (0..<4).map { col in
            (0..<4).map { row in
                var tile = tiles[row][3 - col]
                tile.position = Position(row: col, col: row)
                return tile
            }
        }
    }
    
    func rotateRight() {
        tiles = (0..<4).map { col in
            (0..<4).map { row in
                var tile = tiles[3 - row][col]
                tile.position = Position(row: col, col:  row)
                return tile
            }
        }
    }
}
