//
//  AddNewTile.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

extension GameViewModel {
    
    func addNewTile() {
        
        let emptyPositions = tiles.flatMap { $0 }.filter { $0.value == 0 }
        
        // Check if there are no empty tiles available
        guard !emptyPositions.isEmpty else {
//            isGameOver = true
            return
        }
        
        // Select a random empty position
        let randomIndex = Int.random(in: 0..<emptyPositions.count)
        let randomPosition = emptyPositions[randomIndex].position
        
        // Determine whether to place a 2 or a 4, with a 90% chance of placing a 2
        let newValue = Double.random(in: 0..<1) < 0.9 ? 2 : 4
        
        // Update the tiles array with the new tile
        tiles[randomPosition.row][randomPosition.col] =
        Tile(value: newValue, position: randomPosition)
    }
}
