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
    @AppStorage("sound") var sound = true
    @AppStorage("languageIndex") var languageIndex = 0
    @State private var languageImageOffset: CGFloat = 0
    @State private var darckOpacity: CGFloat = 0
    @State private var languageImages = Arrays.languagesImage
    @State private var settingsTextArray = Arrays.settingsTextArray
    
    var body: some View {
        ZStack {
            Background(backgroundNumber: 1)
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
            Image("settingsFrame")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth*0.33)
                .overlay(
                    ZStack {
                        VStack(spacing: screenWidth*0.005) {
                            Text(settingsTextArray[languageIndex][1])
                                .font(Font.custom("PassionOne-Regular", size: screenWidth*0.045))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2)
                                .shadow(color: .black, radius: 2)
                            Image(sound ? "soundOn" : "soundOff")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth*0.07)
                                .onTapGesture {
                                    sound.toggle()
                                }
                            Text(settingsTextArray[languageIndex][2])
                                .font(Font.custom("PassionOne-Regular", size: screenWidth*0.045))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2)
                                .shadow(color: .black, radius: 2)
                            HStack(spacing: screenWidth*0.02) {
                                Image("arrowLeft")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: screenWidth*0.035)
                                    .onTapGesture {
                                        changeLanguageAnimation(direction: -1)
                                    }
                                ZStack {
                                    Image("languageFrame")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: screenWidth*0.07)
                                    Image(languageImages[languageIndex])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: screenWidth*0.05)
                                        .offset(x: languageImageOffset)
                                        .mask(
                                            Image(languageImages[languageIndex])
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: screenWidth*0.05)
                                        )
                                }
                                Image("arrowLeft")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: screenWidth*0.035)
                                    .scaleEffect(x: -1)
                                    .onTapGesture {
                                        changeLanguageAnimation(direction: 1)
                                    }
                            }
                        }
                        .offset(y: screenWidth*0.035)
                            Text(settingsTextArray[languageIndex][0])
                                .font(Font.custom("PassionOne-Regular", size: screenWidth*0.055))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2)
                                .shadow(color: .black, radius: 2)
                                .offset(y: -screenWidth*0.154)
                    }
                )
                .offset(y: screenWidth*0.02)
                .opacity(darckOpacity)
        }
        
        .onChange(of: sound) { _ in
        if !sound {
            SoundManager.instance.stopAllSounds()
        } else {
            SoundManager.instance.stopAllSounds()
            SoundManager.instance.playSound(sound: "musicMain")
        }
        }
        
        .onAppear {
            showMenuAnimation()
        }
        
    }
    
    
    func changeLanguageAnimation(direction: Double) {
        withAnimation(Animation.easeInOut(duration: 0.5)) {
            languageImageOffset = screenWidth*0.1*direction
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            languageImageOffset = -screenWidth*0.1*direction
            languageIndex += Int(direction)
            if languageIndex == 4 {
                languageIndex = 0
            }
            if languageIndex == -1 {
                languageIndex = 3
            }
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                languageImageOffset = 0
            }
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
