import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published var tiles: [[Tile]] = []
    @Published var isGameOver = false
    @Published var isGameOverRecord = false
    @Published var score: Int = 0
    
    
    init() {
        resetGame()
    }
    
    func resetGame() {

//        Leaderboard.shared.deleteLeaderboard() // Удаление данных
        Leaderboard.shared.loadLeaderboard()
    
        
        if score > maxScoreData.shared.scoreValue {
            maxScoreData.shared.scoreValue = score
            Leaderboard.shared.saveLeaderboard()
        }
        
        if maxCellValue() > maxScoreData.shared.cellValue {
            maxScoreData.shared.cellValue = maxCellValue()
            Leaderboard.shared.saveLeaderboard()
        }
        
        score = 0
        isGameOver = false
        isGameOverRecord = false
        
        tiles = (0..<4).map { row in
            (0..<4).map { col in
                Tile(value: 0, position: Position(row: row, col: col))
            }
        }
        addNewTile()
        addNewTile()
    }
    
    func newGame() {
        
        score = 0
        isGameOver = false
        isGameOverRecord = false
        
        tiles = (0..<4).map { row in
            (0..<4).map { col in
                Tile(value: 0, position: Position(row: row, col: col))
            }
        }
        addNewTile()
        addNewTile()
    }
}
