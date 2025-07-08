//
//  Achievements.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct Achievements: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("selectedBackground") var selectedBackground = 1
    @AppStorage("languageIndex") var languageIndex = 0
    @AppStorage("coinCount") var coinCount = 0
    @State private var achievementsArray = Arrays.achievementsArray
    @State private var darckOpacity: CGFloat = 0
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
                    Text("Achievements")
                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.03))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                        .shadow(color: .black, radius: 2)
                )
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top)
                .opacity(darckOpacity)
            HStack {
                ForEach(0..<achievementsArray.count, id: \.self) { item in
                    ZStack {
                        Image(achievementsArray[item])
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.165)
                        Image("notGet10Button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.15)
                            .offset(y: screenWidth*0.095)
                    }
                    .offset(y: screenWidth*0.02)
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
    Achievements()
}
