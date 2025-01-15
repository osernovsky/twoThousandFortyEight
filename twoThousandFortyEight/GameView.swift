//
//  GameView.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    @State private var showAlert = false
    @State private var showAlertRecord = false
    
    let tileSize: CGFloat = 80
    let padding: CGFloat = 8
    
    var body: some View {
        
        ZStack {
            
            RadialGradient(gradient: Gradient(colors: [Color.colorEmpty, Color.colorBG]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            
            if showAlertRecord {
                NewLeader(isPresented: $showAlertRecord) {
                    // Замыкание вызывается при закрытии
                    viewModel.resetGame()
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .animation(.easeInOut, value: showAlertRecord)
            }
            
            VStack {
                Text("Игра 2048")
                    .font(.system(size: 48))
                    .foregroundColor(.white)
                    .bold()
                    .padding(40)
                
                HStack {
                    Text("Очков: \(viewModel.score)")
                        .monospacedDigit()
                        .font(.title)
                        .foregroundColor(Color.colorForTile(2))
                        .padding(20)
                    Spacer()
                }
                
                GridView(tiles: viewModel.tiles, tileSize: tileSize,
                         padding: padding)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            withAnimation(.easeInOut) {
                                handleSwipe(value: value)
                            }
                        }
                )
                Text("\(maxScoreData.shared.leaderName) - \(maxScoreData.shared.scoreValue) очков, \(maxScoreData.shared.cellValue) в ячейке")
                    .monospacedDigit()
                    .font(.system(size: 18))
                    .foregroundColor(Color.black)
                    .padding(20)
                Spacer()
                
//                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
//                    showAlertRecord = true
//                }
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        viewModel.newGame()
                    }
                }) {
                    Text("Начать игру заново")
                        .padding(10)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.colorForTile(8))
                        .cornerRadius(10)
                }
                .padding(20)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Игра завершена"),
                message: Text("Неплохая попытка, но можно лучше!"),
                dismissButton: .default(Text("ОК")) {
                    viewModel.resetGame()
                }
            )
        }
        .onChange(of: viewModel.isGameOver) { newValue in
            if newValue {
                showAlert = true
            }
        }
        .onChange(of: viewModel.isGameOverRecord) { newValue in
            if newValue {
                showAlertRecord = true
            }
        }
        
    }
    
    private func handleSwipe(value: DragGesture.Value) {
        
        let threshold: CGFloat = 20
        let horizontalShift = value.translation.width
        let verticalShift = value.translation.height
        
        if abs(horizontalShift) > abs(verticalShift) {
            if horizontalShift > threshold {
                viewModel.move(.right)
            } else if horizontalShift < -threshold {
                viewModel.move(.left)
            }
        } else {
            if verticalShift > threshold {
                viewModel.move(.down)
            } else if verticalShift < -threshold {
                viewModel.move(.up)
            }
        }
    }
}

#Preview {
    GameView()
}
