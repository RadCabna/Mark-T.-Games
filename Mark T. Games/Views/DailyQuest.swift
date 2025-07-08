//
//  DailyQuest.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct DailyQuest: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("selectedBackground") var selectedBackground = 1
    @AppStorage("alreadyRecived") var alreadyRecived = false
    @State private var darckOpacity: CGFloat = 0
    @State private var completeLevel = UserDefaults.standard.array(forKey: "completedLevel") as? [Int] ?? Array(repeating: 0, count: 15)
    
    var body: some View {
        ZStack {
            Background(backgroundNumber: selectedBackground)
            HStack {
                Image("backButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.05)
                    .onTapGesture {
                        closeMenuAnimation()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            coordinator.navigateBack()
                        }
                    }
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top)
            .opacity(darckOpacity)
            Image("dailyQuestFrame")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth*0.3)
                .overlay {
                    ZStack {
                        if !alreadyRecived && completeLevel[4] == 0 {
                            Image("notGet10Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth*0.23)
                                .offset(y: screenWidth*0.17)
                        }
                        if !alreadyRecived && completeLevel[4] == 1 {
                            Image("get10Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth*0.23)
                                .offset(y: screenWidth*0.17)
                                .onTapGesture {
                                    coinCount += 10
                                    alreadyRecived = true
                                }
                        }
                        if alreadyRecived{
                            Image("recivedButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth*0.23)
                                .offset(y: screenWidth*0.17)
                        }
                    }
                }
                .opacity(darckOpacity)
        }
        .onAppear {
            showMenuAnimation()
        }
    }
    
    func showMenuAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.2)) {
            darckOpacity = 1
        }
    }
    
    func closeMenuAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.2)) {
            darckOpacity = 0
        }
    }
    
}

#Preview {
    DailyQuest()
}
