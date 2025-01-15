//
//  MaxCellValue.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 15.01.2025.
//

extension GameViewModel {
    
    func maxCellValue() -> Int {
        let maxTile = tiles.flatMap({$0}).map({$0.value}).max()
        return maxTile ?? 0
    }
}
