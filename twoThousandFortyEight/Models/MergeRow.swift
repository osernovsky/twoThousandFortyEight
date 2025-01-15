//
//  MergeRow.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

extension GameViewModel {
    
    func mergeRow(_ row: [Tile]) -> [Tile] {
        var newRow = row
        var scoreToAdd = 0
        
        for i in 0..<row.count - 1 {
            if newRow[i].value != 0 && newRow[i].value == newRow[i + 1].value {
                
                // Merge tiles
                newRow[i].value *= 2
                scoreToAdd += newRow[i].value
                
                // Change the id
                newRow[i].id = newRow[i + 1].id
                
                // new zero Tile on i + ! position
                newRow[i + 1] = Tile(value: 0, position: Position(row: newRow[i].position.row, col: i + 1))
            }
        }
        // Update the score
        score += scoreToAdd
        
        // Compress the row after merging
        return compressRow(newRow)
    }
}
