//
//  StartingScreen.swift
//  twoThousandFortyEight
//
//  Created by Sergey Dubrovin on 14.01.2025.
//

import SwiftUI

struct LaunchScreenView: View {

    @State var isFirstLaunch: Bool = true
    @State private var size = 0.8
    @State private var opacity = 0.0

    var body: some View {
        if !isFirstLaunch {
            GameView()
        } else {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    Image("osCodeLogo")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .scaleEffect(size)
                }
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        self.size = 1.2
                        self.opacity = 1.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {
                            self.isFirstLaunch = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
