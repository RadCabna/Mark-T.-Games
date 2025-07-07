//
//  Shop.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct Shop: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("languageIndex") var languageIndex = 0
    @AppStorage("selectedSkin") var selectedSkin = 0
    @AppStorage("selectedBackground") var selectedBackground = 1
    @State private var darckOpacity: CGFloat = 0
    @State private var shopTextArray = Arrays.shopTextArray
    @State private var shopSkinData = UserDefaults.standard.array(forKey: "shopSkinData") as? [Int] ?? [2,0,0,0]
    @State private var shopBackgroundData = UserDefaults.standard.array(forKey: "shopBackgroundData") as? [Int] ?? [2,0,0,0]
    @State private var shopSkinArray = Arrays.shopSkinArray
    @State private var shopBGArray = Arrays.shopBGArray
    @State private var shopSetOffset:CGFloat = 0
    @State private var shopSet = 1
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
//                    .onTapGesture {
//                        coinCount += 50
//                    }
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
                    Text(shopTextArray[languageIndex][0])
                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.04))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                        .shadow(color: .black, radius: 2)
                )
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top)
                .opacity(darckOpacity)
                HStack {
                    ForEach(0..<shopSkinArray.count, id: \.self) { item in
                    Image("shopItemFrame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.18)
                            .overlay(
                                VStack {
                                    Text("\(shopTextArray[languageIndex][1])#\(item+1)")
                                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.025))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 2)
                                        .shadow(color: .black, radius: 2)
                                    Image(shopSkinArray[item].name)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.12)
                                    if shopSkinData[item] == 2 {
                                        Image("activeShopButton")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: screenWidth*0.14)
                                            .overlay(
                                                Text(shopTextArray[languageIndex][3])
                                                    .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                                                    .foregroundColor(.white)
                                                    .shadow(color: .black, radius: 2)
                                                    .shadow(color: .black, radius: 2)
                                            )
                                            .offset(y: screenWidth*0.01)
                                    }
                                    if shopSkinData[item] == 1 {
                                        Image("activeShopButton")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: screenWidth*0.14)
                                            .overlay(
                                                Text(shopTextArray[languageIndex][4])
                                                    .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                                                    .foregroundColor(.white)
                                                    .shadow(color: .black, radius: 2)
                                                    .shadow(color: .black, radius: 2)
                                            )
                                            .offset(y: screenWidth*0.01)
                                            .onTapGesture {
                                                selectSkin(item: item)
                                            }
                                    }
                                    if shopSkinData[item] == 0 {
                                        Image(coinCount >= shopSkinArray[item].cost ? "activeShopButton" : "unactiveShopButton")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: screenWidth*0.14)
                                            .overlay(
                                                HStack {
                                                    Text(shopTextArray[languageIndex][5])
                                                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                                                        .foregroundColor(.white)
                                                        .shadow(color: .black, radius: 2)
                                                        .shadow(color: .black, radius: 2)
                                                    Text("\(shopSkinArray[item].cost)")
                                                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                                                        .foregroundColor(.white)
                                                        .shadow(color: .black, radius: 2)
                                                        .shadow(color: .black, radius: 2)
                                                    Image("coinImage")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: screenWidth*0.016)
                                                }
                                            )
                                            .offset(y: screenWidth*0.01)
                                            .onTapGesture {
                                                buySkin(item: item)
                                            }
                                    }
                                }
                                    .offset(y: screenWidth*0.004)
                            )
                    }
                    Image("backButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth*0.07)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 4)
                        .onTapGesture {
                            changeShopSetAnimation()
                        }
                }
                .offset(x: screenWidth - shopSetOffset, y: screenWidth*0.03)
            
                HStack {
                    Image("backButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth*0.07)
                        .shadow(color: .black, radius: 4)
                        .onTapGesture {
                            changeShopSetAnimation()
                        }
                    ForEach(0..<shopBGArray.count, id: \.self) { item in
                    Image("shopItemFrame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.18)
                            .overlay(
                                VStack(spacing: screenWidth*0.02) {
                                    Text("\(shopTextArray[languageIndex][2])#\(item+1)")
                                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.025))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 2)
                                        .shadow(color: .black, radius: 2)
                                    Image(shopBGArray[item].name)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.105)
                                    if shopBackgroundData[item] == 2 {
                                        Image("activeShopButton")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: screenWidth*0.14)
                                            .overlay(
                                                Text(shopTextArray[languageIndex][3])
                                                    .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                                                    .foregroundColor(.white)
                                                    .shadow(color: .black, radius: 2)
                                                    .shadow(color: .black, radius: 2)
                                            )
                                            .offset(y: screenWidth*0.01)
                                    }
                                    if shopBackgroundData[item] == 1 {
                                        Image("activeShopButton")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: screenWidth*0.14)
                                            .overlay(
                                                Text(shopTextArray[languageIndex][4])
                                                    .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                                                    .foregroundColor(.white)
                                                    .shadow(color: .black, radius: 2)
                                                    .shadow(color: .black, radius: 2)
                                            )
                                            .offset(y: screenWidth*0.01)
                                            .onTapGesture {
                                                selectBG(item: item)
                                            }
                                    }
                                    if shopBackgroundData[item] == 0 {
                                        Image(coinCount >= shopBGArray[item].cost ? "activeShopButton" : "unactiveShopButton")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: screenWidth*0.14)
                                            .overlay(
                                                HStack {
                                                    Text(shopTextArray[languageIndex][5])
                                                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                                                        .foregroundColor(.white)
                                                        .shadow(color: .black, radius: 2)
                                                        .shadow(color: .black, radius: 2)
                                                    Text("\(shopBGArray[item].cost)")
                                                        .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                                                        .foregroundColor(.white)
                                                        .shadow(color: .black, radius: 2)
                                                        .shadow(color: .black, radius: 2)
                                                    Image("coinImage")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: screenWidth*0.016)
                                                }
                                            )
                                            .offset(y: screenWidth*0.01)
                                            .onTapGesture {
                                                buyBG(item: item)
                                            }
                                    }
                                }
                                    .offset(y: screenWidth*0.004)
                            )
                    }
                }
                .offset(x:-shopSetOffset, y: screenWidth*0.03)
        }
        
        .onAppear {
            showMenuAnimation()
        }
        
    }
    
    func changeShopSetAnimation() {
        if shopSet == 1 {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                shopSetOffset = screenWidth
            }
            shopSet = 2
        } else {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                shopSetOffset = 0
            }
            shopSet = 1
        }
    }
    
    func buySkin(item: Int) {
        if coinCount >= shopSkinArray[item].cost {
            coinCount -= shopSkinArray[item].cost
            shopSkinData[item] = 1
            UserDefaults.standard.set(shopSkinData, forKey: "shopSkinData")
        }
    }
    
    func selectSkin(item: Int) {
        for i in 0..<shopSkinArray.count {
            if shopSkinData[i] == 2 {
                shopSkinData[i] = 1
                shopSkinData[item] = 2
                UserDefaults.standard.set(shopSkinData, forKey: "shopSkinData")
            }
        }
        selectedSkin = item
    }
    
    func buyBG(item: Int) {
        if coinCount >= shopBGArray[item].cost {
            coinCount -= shopBGArray[item].cost
            shopBackgroundData[item] = 1
            UserDefaults.standard.set(shopBackgroundData, forKey: "shopBackgroundData")
        }
    }
    
    func selectBG(item: Int) {
        for i in 0..<shopBGArray.count {
            if shopBackgroundData[i] == 2 {
                shopBackgroundData[i] = 1
                shopBackgroundData[item] = 2
                UserDefaults.standard.set(shopBackgroundData, forKey: "shopBackgroundData")
            }
        }
        selectedBackground = item + 1
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
    Shop()
}
