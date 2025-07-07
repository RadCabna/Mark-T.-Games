//
//  BuildingProccess.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 07.07.2025.
//

import SwiftUI

struct BuildingProccess: View {
    @State private var timer: Timer? = nil
    @State private var dustRotation:CGFloat = 0
    @State private var hummerRotation:CGFloat = 0
    var body: some View {
        ZStack {
            Image("puff")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth*0.1)
                .rotationEffect(Angle(degrees: dustRotation))
            Image("hummer")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth*0.05)
                .rotationEffect(Angle(degrees: hummerRotation))
                .offset(x: screenWidth*0.02)
        }
        .onAppear {
            buildingAnimation()
        }
    }
    
    func buildingAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
            dustRotation += 90
            withAnimation(Animation.linear(duration: 0.2)) {
                
                hummerRotation = -35
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                dustRotation += 90
                withAnimation(Animation.linear(duration: 0.2)) {
                    
                    hummerRotation = 0
                }
            }
        }
    }
    
}

#Preview {
    BuildingProccess()
}
