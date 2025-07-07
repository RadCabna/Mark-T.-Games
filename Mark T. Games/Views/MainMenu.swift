//
//  MainMenu.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct MainMenu: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("languageIndex") var languageIndex = 0
    @State private var angle: Double = -90
    @State private var angle1: Double = -90
    @State private var angle2: Double = -90
    @State private var angle3: Double = -90
    @State private var darckOpacity: CGFloat = 0
    @State private var menuTextArray = Arrays.mainMenuTextArray
    var body: some View {
        ZStack {
            Background(backgroundNumber: 1)
            HStack {
                Image("settingsButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.05)
                    .onTapGesture {
                        closeMenuAnimation()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            coordinator.navigate(to: .settings)
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
            VStack {
                Buttons(size: 0.3, text: menuTextArray[languageIndex][0])
                    .offset(y: screenWidth*0.05)
                    .rotation3DEffect(
                        .degrees(angle),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .onTapGesture {
                        closeMenuAnimation()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            coordinator.navigate(to: .choseLevel)
                        }
                    }
                    .offset(y: -screenWidth*0.05)
                Buttons(size: 0.3, text: menuTextArray[languageIndex][1])
                    .offset(y: screenWidth*0.05)
                    .rotation3DEffect(
                        .degrees(angle1),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .onTapGesture {
                        closeMenuAnimation()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            coordinator.navigate(to: .shop)
                        }
                    }
                    .offset(y: -screenWidth*0.05)
                Buttons(size: 0.3, text: menuTextArray[languageIndex][2])
                    .offset(y: screenWidth*0.05)
                    .rotation3DEffect(
                        .degrees(angle2),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .onTapGesture {
                        closeMenuAnimation()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            coordinator.navigate(to: .achievements)
                        }
                    }
                    .offset(y: -screenWidth*0.05)
                Buttons(size: 0.3, text: menuTextArray[languageIndex][3])
                    .offset(y: screenWidth*0.05)
                    .rotation3DEffect(
                        .degrees(angle3),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .onTapGesture {
                        closeMenuAnimation()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            coordinator.navigate(to: .quest)
                        }
                    }
                    .offset(y: -screenWidth*0.05)
            }
            .offset(y: screenWidth*0.01)
        }
        
        .onAppear {
            showMenuAnimation()
            buttonAnimation(delay: 0, angle: $angle)
            buttonAnimation(delay: 0.1, angle: $angle1)
            buttonAnimation(delay: 0.2, angle: $angle2)
            buttonAnimation(delay: 0.3, angle: $angle3)
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
    
    func buttonAnimation(delay: CGFloat, angle: Binding<Double>) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            withAnimation(Animation.spring(duration: 1)) {
                angle.wrappedValue = 50
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(Animation.spring(duration: 1)) {
                    angle.wrappedValue = -20
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(Animation.spring(duration: 1)) {
                    angle.wrappedValue = 20
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(Animation.spring(duration: 1)) {
                    angle.wrappedValue = -10
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(Animation.spring(duration: 1)) {
                    angle.wrappedValue = 0
                }
            }
        }
    }
    
}

#Preview {
    MainMenu()
}
