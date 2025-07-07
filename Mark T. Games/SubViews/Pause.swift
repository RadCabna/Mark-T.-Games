//
//  Pause.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct Pause: View {
    @EnvironmentObject var coordinator: Coordinator
    @State private var pauseTextArray = Arrays.pauseTextArray
    @AppStorage("languageIndex") var languageIndex = 0
    @Binding var pauseTapped: Bool
    var body: some View {
        Image("loseWinPauseFrame")
            .resizable()
            .scaledToFit()
            .frame(width: screenWidth*0.3)
            .overlay {
                VStack(spacing: screenWidth*0.01) {
                    Text(pauseTextArray[languageIndex][0])
                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.04))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                        .shadow(color: .black, radius: 2)
                        .offset(y: -screenWidth*0.04)
                    Buttons(size:0.23, text: pauseTextArray[languageIndex][1])
                        .onTapGesture {
                            pauseTapped.toggle()
                        }
                    Buttons(size:0.23, text: pauseTextArray[languageIndex][2])
                        .onTapGesture {
                            coordinator.navigate(to: .mainMenu)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                                coordinator.navigate(to: .game)
                            }
                        }
                    Buttons(size:0.23, text: pauseTextArray[languageIndex][3])
                        .onTapGesture {
                            coordinator.navigate(to: .mainMenu)
                        }
                }
            }
    }
}

#Preview {
    Pause(pauseTapped: .constant(true))
}
