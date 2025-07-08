//
//  Loading.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct Loading: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("levelInfo") var level = false
    @State private var loadingOpacity: CGFloat = 0
    @State private var loadingProgress: CGFloat = 1
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            let isLandscape = width > height
            if isLandscape {
                ZStack {
                    Background(backgroundNumber: 6)
                    VStack() {
                        Image("icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width*0.2)
                        Text("Fun Starts Here")
                            .font(Font.custom("PassionOne-Regular", size: width*0.08))
                            .foregroundColor(Color("loadingTextColor"))
                            .shadow(color: .black, radius: 2)
                            .shadow(color: .black, radius: 2)
                        ZStack {
                            Image("loadingBarBack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.5)
                            Image("loadingBarFront")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.49)
                                .offset(x: -width*0.5*loadingProgress)
                                .mask(
                                    Image("loadingBarFront")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: width*0.49)
                                )
                            Text("Loading...")
                                .font(Font.custom("PassionOne-Regular", size: width*0.035))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2)
                                .shadow(color: .black, radius: 2)
                        }
                    }
                    .offset(y: height*0.05)
                    .opacity(loadingOpacity)
                }
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            } else {
                ZStack {
                    Background(backgroundNumber: 6)
                    VStack() {
                        Image("icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: height*0.2)
                        Text("Fun Starts Here")
                            .font(Font.custom("PassionOne-Regular", size: height*0.08))
                            .foregroundColor(Color("loadingTextColor"))
                            .shadow(color: .black, radius: 2)
                            .shadow(color: .black, radius: 2)
                        ZStack {
                            Image("loadingBarBack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: height*0.5)
                            Image("loadingBarFront")
                                .resizable()
                                .scaledToFit()
                                .frame(width: height*0.49)
                                .offset(x: -height*0.5*loadingProgress)
                                .mask(
                                    Image("loadingBarFront")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: height*0.49)
                                )
                            Text("Loading...")
                                .font(Font.custom("PassionOne-Regular", size: height*0.035))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2)
                                .shadow(color: .black, radius: 2)
                        }
                    }
//                    .offset(y: height*0.05)
                    .rotationEffect(Angle(degrees: -90))
                    .opacity(loadingOpacity)
                }
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
        
        .onChange(of: level) { _ in
            if level {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    coordinator.navigate(to: .mainMenu)
                }
            }
        }
        
        .onAppear {
            loadingProgressAnimation()
        }
        
    }
    
    func loadingProgressAnimation() {
        withAnimation(Animation.easeInOut(duration: 1)) {
         loadingOpacity = 1
        }
        withAnimation(Animation.easeInOut(duration: 5)) {
            loadingProgress = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            coordinator.navigate(to: .mainMenu)
        }
    }
    
}

#Preview {
    Loading()
}
