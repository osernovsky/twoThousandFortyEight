//
//  LeaderBoard.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

import Foundation

class Leaderboard {
    
    static let shared = Leaderboard()
    private static let storageKey: String = "MaxScoreData"
    
    // MARK: Функция записи таблицы
    
    func saveLeaderboard() {
        
        do {
            let data = try JSONEncoder().encode(maxScoreData.shared)
            UserDefaults.standard.set(data, forKey: Leaderboard.storageKey)
        } catch {
            print("Ошибка записи данных: \(error)")
        }
    }
    
    // MARK: Функция загрузки таблицы
    
    func loadLeaderboard() {
        
        guard let data = UserDefaults.standard.data(forKey: Leaderboard.storageKey) else {
            saveLeaderboard()
            return
        }
        
        do {
            maxScoreData.shared = try JSONDecoder().decode(maxScoreData.self, from: data)
        } catch {
            print("Ошибка загрузки данных: \(error)")
        }
    }
    
    // MARK: Функция удаления таблицы из памяти телефона
    
    func deleteLeaderboard() {
        UserDefaults.standard.removeObject(forKey: Leaderboard.storageKey)
    }
}
