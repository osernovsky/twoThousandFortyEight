//
//  TileView.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

import SwiftUI

struct TileView: View {
    
    let tile: Tile
    let tileSize: CGFloat
    let padding: CGFloat
    
    var body: some View {
        
        let tilePosition = getTilePosition()
        
        RoundedRectangle(cornerRadius:padding)
            .fill(Color.colorForTile(tile.value))
            .frame(width: tileSize, height: tileSize)
            .overlay(
                Text(tile.value > 0 ? "\(tile.value)" : "")
                    .font(tile.value > 999 ? .title2 : .title)
                    .foregroundColor(tile.value > 4 ? .white : .black)
            )
            .position(tilePosition)
            .animation(.easeInOut(duration: 0.2), value: tile.position)
            .transition(
                .scale(scale: 0.0)
                .combined(with: .offset(
                    x: tilePosition.x - 2.0 * tileSize,
                    y: tilePosition.y - 2.0 * tileSize
                ))
            )
    }
    
    private func getTilePosition() -> CGPoint {
        
        let x = CGFloat(tile.position.col) * (tileSize + padding) + tileSize / 2
        let y = CGFloat(tile.position.row) * (tileSize + padding) + tileSize / 2
        return CGPoint(x: x, y: y)
    }
}
