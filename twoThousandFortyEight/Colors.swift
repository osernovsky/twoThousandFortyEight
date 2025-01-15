//
//  Colors.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

import SwiftUI

extension Color {
    
    static let colorBG  = Color(hex: "#BBADA0")
    static let colorEmpty   = Color(hex: "#CDC1B4")
    
    static func colorForTile(_ value: Int) -> Color {
        switch value {
        case 0:
            return Color(hex: "#CDC1B4") //  color for empty
        case 2:
            return Color(hex: "#EEE4DA") // Light beige
        case 4:
            return Color(hex: "#EDE0C8") // Beige
        case 8:
            return Color(hex: "#F2B179") // Light orange
        case 16:
            return Color(hex: "#F59563") // Orange
        case 32:
            return Color(hex: "#F67C5F") // Darker orange
        case 64:
            return Color(hex: "#F65E3B") // Dark orange-red
        case 128:
            return Color(hex: "#EDCF72") // Yellow
        case 256:
            return Color(hex: "#EDCC61") // Darker yellow
        case 512:
            return Color(hex: "#EDC850") // Gold
        case 1024:
            return Color(hex: "#EDC53F") // Dark gold
        case 2048:
            return Color(hex: "#EDC22E") // Bright gold
        default:
            return Color(hex: "#CDC1B4") // Default color (for empty or non-standard tiles)
        }
    }
}

extension Color {
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) =
            (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) =
            (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
