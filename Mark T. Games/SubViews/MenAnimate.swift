//
//  MenAnimate.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct MenAnimate: View {
    @AppStorage("menSet") var menSet = 0
    @State private var timer: Timer?
    @State private var menSpriteArray = Arrays.men1SpritesArray
    @State private var menImage = "men1_1"
    @State private var menIndex = 0
    var size:Double = 1
    var body: some View {
        Image(menImage)
            .resizable()
            .scaledToFit()
            .frame(height: screenWidth*0.1*size)
            .onAppear {
                menWalk()
            }
    }
    
    
    
    func menWalk() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if menIndex < 6 {
                menIndex += 1
            } else {
                if menSet == 1 || menSet == 0 {
                    menIndex = 0
                } else {
                    menIndex = 1
                }
            }
            menImage = menSpriteArray[menIndex]
        }
    }
    
    func stopHorseRun() {
        timer?.invalidate()
        timer = nil
        menImage = menSpriteArray[0]
    }
    
}

#Preview {
    MenAnimate()
}
