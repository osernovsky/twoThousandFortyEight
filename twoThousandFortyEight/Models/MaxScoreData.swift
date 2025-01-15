//
//  MaxScoreData.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

struct maxScoreData: Codable {
    
    static var shared = maxScoreData()
    init() {}
    
    var scoreValue: Int = 0
    var cellValue: Int = 0
    var leaderName: String = "Безымянный"
}

//var maxScore = maxScoreData()
