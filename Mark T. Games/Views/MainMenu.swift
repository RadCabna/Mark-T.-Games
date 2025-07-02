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
    @State private var angle: Double = -90
    @State private var angle1: Double = -90
    @State private var angle2: Double = -90
    @State private var angle3: Double = -90
    @State private var darckOpacity: CGFloat = 0
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
            VStack {
                Buttons(size: 0.3, text: "Start The Game")
                    .offset(y: screenWidth*0.05)
                    .rotation3DEffect(
                        .degrees(angle),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .offset(y: -screenWidth*0.05)
                Buttons(size: 0.3, text: "Store")
                    .offset(y: screenWidth*0.05)
                    .rotation3DEffect(
                        .degrees(angle1),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .offset(y: -screenWidth*0.05)
                Buttons(size: 0.3, text: "Achievements")
                    .offset(y: screenWidth*0.05)
                    .rotation3DEffect(
                        .degrees(angle2),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .offset(y: -screenWidth*0.05)
                Buttons(size: 0.3, text: "Daily Quest")
                    .offset(y: screenWidth*0.05)
                    .rotation3DEffect(
                        .degrees(angle3),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .offset(y: -screenWidth*0.05)
            }
            .offset(y: screenWidth*0.04)
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
