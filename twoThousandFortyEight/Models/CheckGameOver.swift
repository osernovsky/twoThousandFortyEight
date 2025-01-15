//
//  GameOverCheck.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

extension GameViewModel {
    
    func checkGameOver() {
        
        let emptyPositions = tiles.flatMap { $0 }.filter { $0.value == 0 }
        if !emptyPositions.isEmpty { return } // Есть пустые ячейки на поле
        
        for row in 0..<4 {
            for col in 0..<4 {
                if row + 1 < 4 && tiles[row][col] == tiles[row + 1][col] {
                    return // Есть возможное слияние вниз
                }
                if col + 1 < 4  && tiles[row][col] == tiles[row][col + 1] {
                    return // Есть возможное слияние вправо
                }
            }
        }
        
        // Нет ни пустых клеток, ни возможных слияний
        if score > maxScoreData.shared.scoreValue {
            isGameOverRecord = true // Игра окончена, новый рекорд
        } else {
            isGameOver = true // Игра окончена
        }
    }
}
