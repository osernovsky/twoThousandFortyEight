//
//  Move.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

extension GameViewModel {
    
    func move(_ direction: Direction) {
        var moved = false
        
        switch direction {
        case .up:
            rotateLeft()
        case .down:
            rotateRight()
        case .right:
            rotateRight()
            rotateRight()
        case .left:
            break
        }
        
        for i in 0..<4 {
            let row = getRow(i)
            let compressedRow = compressRow(row)
            let mergedRow = mergeRow(compressedRow)
            if mergedRow != row {
                moved = true
                updateRow(i, with: mergedRow)
            }
        }
        
        switch direction {
        case .up:
            rotateRight()
        case .down:
            rotateLeft()
        case .right:
            rotateRight()
            rotateRight()
        case .left:
            break
        }
        
        if moved {
            addNewTile()
            checkGameOver()
        }
    }
}
