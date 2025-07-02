//
//  Settings.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("languageIndex") var languageIndex = 0
    @State private var darckOpacity: CGFloat = 0
    @State private var languageImages = Arrays.languagesImage
    
    var body: some View {
        ZStack {
            Background(backgroundNumber: 1)
            HStack {
                Image("settingsButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.06)
                Spacer()
                Image("coin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.06)
                Image("coinFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.23)
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
            Image("settingsFrame")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth*0.4)
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
    Settings()
}
