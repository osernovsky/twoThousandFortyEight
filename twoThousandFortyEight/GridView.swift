//
//  GridView.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

import SwiftUI

struct GridView: View {
    let tiles: [[Tile]]
    let tileSize : CGFloat
    let padding : CGFloat
    
    var body: some View {
       ZStack {
           
         // Background grid
            VStack(spacing: padding) {
               ForEach(0..<4) { row in
                   HStack(spacing: padding) {
                       ForEach(0..<4) { col in
                           RoundedRectangle(cornerRadius: padding)
                               .fill(Color.colorForTile(0))
                               .frame(width: tileSize, height: tileSize)
                       }
                   }
               }
           }
            .padding()
            .background(Color(hex: "#BBADA0"))

            // Foreground tiles (only non-zero values)
             ForEach(tiles.flatMap { $0 }.filter { $0.value != 0 }){ tile in
                TileView(tile: tile, tileSize: tileSize, padding: padding)
             }
             .padding()
        }
        .frame(width: 4 * tileSize + 3 * padding,
               height: 4 * tileSize +  3 * padding) // Adjust frame size
    }
}
