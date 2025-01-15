//
//  RowOperations.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

extension GameViewModel {
    
    func getRow(_ index: Int) -> [Tile] {
        return tiles[index]
    }

    func updateRow(_ index: Int, with newRow: [Tile]) {
        for col in 0..<4 {
            tiles[index][col] = newRow[col]
        }
    }
}
