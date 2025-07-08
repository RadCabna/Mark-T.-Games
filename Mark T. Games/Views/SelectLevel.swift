//
//  SelectLevel.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct SelectLevel: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("selectedBackground") var selectedBackground = 1
    @AppStorage("languageIndex") var languageIndex = 0
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("levelNumber") var levelNumber = 0
    @State private var darckOpacity: CGFloat = 0
    @State private var selectLevelTextArray = Arrays.selectLevelTextArray
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
                Image("coin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.05)
//                    .onTapGesture {
//                        coinCount += 50
//                    }
                Image("coinFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.2)
                    .overlay(
                        Text("\(coinCount)")
                            .font(Font.custom("PassionOne-Regular", size: screenWidth*0.04))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)
                            .shadow(color: .black, radius: 2)
                    )
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top)
            .opacity(darckOpacity)
            Image("headPlate")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth*0.24)
                .overlay(
                    Text(selectLevelTextArray[languageIndex][0])
                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.025))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                        .shadow(color: .black, radius: 2)
                )
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top)
                .opacity(darckOpacity)
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: screenWidth*0.01) {
                    ForEach(0..<completeLevel.count, id: \.self) { index in
                        if completeLevel[index] == 1 || index == 0 {
                            ZStack {
                                Image("levelPlate")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: screenWidth*0.09)
                                VStack {
                                    Text(selectLevelTextArray[languageIndex][1])
                                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.03))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 2)
                                        .shadow(color: .black, radius: 2)
                                    Text("\(index+1)")
                                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.03))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 2)
                                        .shadow(color: .black, radius: 2)
                                }
                            }
                            .onTapGesture {
                                levelNumber = index+1
                                closeMenuAnimation()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    coordinator.navigate(to: .game)
                                }
                            }
                        } else {
                            ZStack {
                                Image("levelPlate")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: screenWidth*0.09)
                                VStack {
                                    Text(selectLevelTextArray[languageIndex][1])
                                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.03))
                                        .foregroundColor(Color("darkText"))
//                                        .shadow(color: .black, radius: 1) 
                                    Text("\(index+1)")
                                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.03))
                                        .foregroundColor(Color("darkText"))
//                                        .shadow(color: .black, radius: 1)
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: screenWidth*0.5)
            }
            .opacity(darckOpacity)
            .offset(y: screenWidth*0.05)
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
    SelectLevel()
}
