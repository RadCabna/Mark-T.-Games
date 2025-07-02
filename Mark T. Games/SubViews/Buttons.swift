//
//  Buttons.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct Buttons: View {
    var size: CGFloat = 0.25
    var text = "BACKGROUND"
    var body: some View {
       Image("buttonFrame")
            .resizable()
            .scaledToFit()
            .frame(width: screenWidth*size)
            .overlay(
                Text(text)
                    .font(Font.custom("PassionOne-Regular", size: screenWidth*size*0.13))
                    .foregroundColor(.white)

            )
            .shadow(color:.black, radius: 3, x: 2, y: 2)
    }
}

#Preview {
    Buttons()
}
