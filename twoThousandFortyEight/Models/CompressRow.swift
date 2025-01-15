//
//  CompressRow.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

extension GameViewModel {
    
    func compressRow(_ row: [Tile]) -> [Tile] {
        let nonZeroTiles = row.filter { $0.value != 0 }
        
        // Guard to check if we need to compress
        guard !nonZeroTiles.isEmpty, nonZeroTiles.count != 4,
              !(nonZeroTiles.count == 1 && nonZeroTiles[0].position.col == 0)
        else {
            // If the row is already in a compressed state, return it as is
            return row
        }
        
        // Create new row with non-zero tiles and update their positions
        let newRow: [Tile] = nonZeroTiles.enumerated().map { (index, tile) in
            var updatedTile = tile
            updatedTile.position =
            Position(row: tile.position.row, col: index)
            return updatedTile
        }
        
        // Add zeros to the end of the row with updated positions
        let zeros = (newRow.count..<row.count).map { colIndex in
            Tile(value: 0, position:
                    Position(row: row[0].position.row, col: colIndex))
        }
        
        return newRow + zeros
    }
}
