//
//  NewLeader.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 15.01.2025.
//

import SwiftUI

struct NewLeader: View {
    
    @Binding var isPresented: Bool
    @State var playerName: String = ""
    var onDismiss: () -> Void
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Игра завершена")
                .font(.title)
                .bold()
            
            Text("Отличная игра, ваше имя достойно попасть в списки лучших!")
                .multilineTextAlignment(.center)
                .padding()
            
            TextField("Введите ваше имя", text: $playerName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.default)
                .autocapitalization(.words)
                .onChange(of: playerName) { newValue in
                    if newValue.count > 10 {
                        playerName = String(newValue.prefix(10))
                    }
                }
                .padding(.horizontal, 20)
            
            HStack(spacing: 20) {
                Button("Сохранить") {
                    maxScoreData.shared.leaderName = playerName == "" ? "Безымянный" : playerName
                    Leaderboard.shared.saveLeaderboard()
                    withAnimation {
                        isPresented = false
                    }
                    onDismiss()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding()
        .transition(.move(edge: .bottom).combined(with: .opacity))
        .zIndex(1)
    }
}
