//
//  YouWin.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct YouWin: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("languageIndex") var languageIndex = 0
    @AppStorage("levelNumber") var levelNumber = 1
    @AppStorage("coinCount") var coinCount = 0
    @State private var winTextArray = Arrays.youWinTextArray
    @Binding var woodCount: Int
    @Binding var woodTarget: Int
    @Binding var stoneCount: Int
    @Binding var stoneTarget: Int
    @Binding var threadCount: Int
    @Binding var threadTarget: Int
    @Binding var steps: Int
    @Binding var menCount: Int
    @Binding var menRemainingCount: Int
    @State private var completeLevel = UserDefaults.standard.array(forKey: "completedLevel") as? [Int] ?? Array(repeating: 0, count: 15)
    var body: some View {
        Image("loseWinPauseFrame")
            .resizable()
            .scaledToFit()
            .frame(width: screenWidth*0.3)
            .overlay {
                VStack(spacing: screenWidth*0.01) {
                    Text(winTextArray[languageIndex])
                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.04))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                        .shadow(color: .black, radius: 2)
                        .offset(y: -screenWidth*0.02)
                    HStack {
                        Image("stepCountFrame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.06)
                            .overlay(
                                Text("\(steps)/10")
                                    .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 2)
                                    .shadow(color: .black, radius: 2)
                                    .offset(y: screenWidth*0.01)
                            )
                        Image("menCountFrame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.06)
                            .overlay(
                                Text("\(menRemainingCount)/\(menCount)")
                                    .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 2)
                                    .shadow(color: .black, radius: 2)
                                    .offset(y: screenWidth*0.01)
                            )
                    }
                    HStack {
                        Image("woodCount")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.06)
                            .overlay(
                                Text("\(woodCount)/\(woodTarget)")
                                    .font(Font.custom("PassionOne-Regular", size: screenWidth*0.025))
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 2)
                                    .shadow(color: .black, radius: 2)
                                    .offset(y: screenWidth*0.01)
                            )
                        Image("rockCount")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.06)
                            .overlay(
                                Text("\(stoneCount)/\(stoneTarget)")
                                    .font(Font.custom("PassionOne-Regular", size: screenWidth*0.025))
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 2)
                                    .shadow(color: .black, radius: 2)
                                    .offset(y: screenWidth*0.01)
                            )
                        Image("threadCount")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.06)
                            .overlay(
                                Text("\(threadCount)/\(threadTarget)")
                                    .font(Font.custom("PassionOne-Regular", size: screenWidth*0.025))
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 2)
                                    .shadow(color: .black, radius: 2)
                                    .offset(y: screenWidth*0.01)
                            )
                    }
                    HStack {
                        Image("homeMiniButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.06)
                            .onTapGesture {
                                completeLevel[levelNumber] = 1
                                coinCount += 2*(woodCount + stoneCount + threadCount)
                                UserDefaults.standard.setValue(completeLevel, forKey: "completedLevel")
                                coordinator.navigate(to: .mainMenu)
                            }
                        Image("restartMiniButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.06)
                            .onTapGesture {
                                completeLevel[levelNumber] = 1
                                coinCount += 2*(woodCount + stoneCount + threadCount)
                                UserDefaults.standard.setValue(completeLevel, forKey: "completedLevel")
                                coordinator.navigate(to: .mainMenu)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                                    coordinator.navigate(to: .game)
                                }
                            }
                        Image("nextMiniButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.06)
                            .onTapGesture {
                                completeLevel[levelNumber] = 1
                                coinCount += 2*(woodCount + stoneCount + threadCount)
                                UserDefaults.standard.setValue(completeLevel, forKey: "completedLevel")
                                levelNumber += 1
                                coordinator.navigate(to: .mainMenu)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                                    coordinator.navigate(to: .game)
                                }
                            }
                    }
                }
            }
    }
}

#Preview {
    YouWin(woodCount: .constant(0), woodTarget: .constant(0), stoneCount: .constant(0), stoneTarget: .constant(0), threadCount: .constant(0), threadTarget: .constant(0), steps: .constant(0), menCount: .constant(0), menRemainingCount: .constant(0))
}
