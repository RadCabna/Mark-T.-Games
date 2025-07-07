//
//  MenAnimate.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct MenAnimate: View {
//    @AppStorage("selectedSkin") var selectedSkin = 0
    @AppStorage("selectedSkin") var selectedSkin = 0
    @State private var timer: Timer?
    @State private var menSpriteArray = Arrays.men1SpritesArray
    @State private var menImage = "men1_1"
    @State private var menIndex = 0
    @Binding var animate: Bool
    var size:Double = 1
    var body: some View {
        Image(menImage)
            .resizable()
            .scaledToFit()
            .frame(height: screenWidth*0.05*size)
            .onChange(of: animate) { _ in
              if animate {
                    menWalk()
              } else {
                  stopMenAnimate()
              }
            }
            .onAppear {
                whatStartMenImage()
                stopMenAnimate()
            }
           
    }
    
    func whatStartMenImage() {
        switch selectedSkin {
        case 0:
            menSpriteArray = Arrays.men1SpritesArray
        case 1:
            menSpriteArray = Arrays.men2SpritesArray
        case 2:
            menSpriteArray = Arrays.men3SpritesArray
        case 3:
            menSpriteArray = Arrays.men4SpritesArray
        default:
            break
        }
    }
    
    func menWalk() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if menIndex < 6 {
                menIndex += 1
            } else {
                if selectedSkin == 1 || selectedSkin == 0 {
                    menIndex = 0
                } else {
                    menIndex = 1
                }
            }
            menImage = menSpriteArray[menIndex]
        }
    }
    
    func stopMenAnimate() {
        timer?.invalidate()
        timer = nil
        if selectedSkin == 1 || selectedSkin == 0 {
            menImage = menSpriteArray[2]
        } else {
            menImage = menSpriteArray[0]
        }
    }
    
}

#Preview {
    MenAnimate(animate: .constant(false))
}
