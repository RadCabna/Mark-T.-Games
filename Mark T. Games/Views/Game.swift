//
//  Game.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import SwiftUI

struct Game: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("languageIndex") var languageIndex = 0
    @AppStorage("selectedSkin") var selectedSkin = 0
    @AppStorage("levelNumber") var levelNumber = 1
    @State private var gameTextArray = Arrays.gameTextArray
    @State private var cageArray = Arrays.coordinatesArray
    @State private var menInGameArray = Arrays.menInGameArray
    @State private var resourcesArray = Arrays.level1ResursesArray
    @State private var woodCount = 0
    @State private var woodTarget = 2
    @State private var stoneCount = 0
    @State private var stoneTarget = 2
    @State private var threadCount = 0
    @State private var threadTarget = 2
    @State private var steps = 0
    @State private var menCount = 5
    @State private var menRemainingCount = 5
    @State private var selectedMenIndex = 0
    @State private var canMakeStep = false
    @State private var canChose = true
    @State private var collectButtonOpacity: CGFloat = 0
    @State private var persSign = "persFrame"
    @State private var darkShadowOpacity: CGFloat = 0
    @State private var pauseTapped: Bool = false
    @State private var youWin = false
    @State private var youLose = false
    @State private var missionComplete = false
    @State private var targetImage = "cart"
    @State private var buildingOpacity: CGFloat = 0
    var body: some View {
        ZStack {
            Background(backgroundNumber: 5)
            HStack {
                Image("woodCount")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.06)
                    .overlay(
                        Text("\(woodCount)/\(woodTarget)")
                            .font(Font.custom("PassionOne-Regular", size: screenWidth*0.025))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)
                            .shadow(color: .black, radius: 2)
                            .offset(y: screenWidth*0.01)
                    )
                Image("rockCount")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.06)
                    .overlay(
                        Text("\(stoneCount)/\(stoneTarget)")
                            .font(Font.custom("PassionOne-Regular", size: screenWidth*0.025))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)
                            .shadow(color: .black, radius: 2)
                            .offset(y: screenWidth*0.01)
                    )
                Image("threadCount")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.06)
                    .overlay(
                        Text("\(threadCount)/\(threadTarget)")
                            .font(Font.custom("PassionOne-Regular", size: screenWidth*0.025))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)
                            .shadow(color: .black, radius: 2)
                            .offset(y: screenWidth*0.01)
                    )
                Spacer()
                Image("stepCountFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.06)
                    .overlay(
                        Text("\(steps)/10")
                            .font(Font.custom("PassionOne-Regular", size: screenWidth*0.023))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)
                            .shadow(color: .black, radius: 2)
                            .offset(y: screenWidth*0.01)
                    )
                Image("pauseButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.06)
                    .onTapGesture {
                        showDarknessAnimation()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            pauseTapped.toggle()
                        }
                    }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .frame(maxWidth: screenWidth*0.95)
            .padding(.top)
            
            ForEach(0..<cageArray.count, id: \.self) { row in
                ForEach(0..<cageArray[row].count, id: \.self) { col in
                    ZStack {
                        Image("emptyCage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.08)
                            .offset(x: cageArray[row][col].offsetX * screenWidth/880, y: cageArray[row][col].offsetY * screenWidth/880)
                        if resourcesArray[row][col].wood != 0 {
                            Image("woodCage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth*0.08)
                                .overlay(
                                    ZStack {
                                        Image("woodSign")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: screenWidth*0.025)
                                        Text("\(resourcesArray[row][col].wood)/2")
                                            .font(Font.custom("PassionOne-Regular", size: screenWidth*0.009))
                                            .foregroundColor(.white)
                                            .offset(y: screenWidth*0.003)
                                    }
                                        .offset(x: screenWidth*0.02, y: -screenWidth*0.01)
                                )
                                .offset(x: cageArray[row][col].offsetX * screenWidth/880, y: cageArray[row][col].offsetY * screenWidth/880)
                                .opacity(cageArray[row][col].lineColor == 1 ? 0 : 1)
                        }
                        if resourcesArray[row][col].stone != 0 {
                            Image("rockCage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth*0.08)
                                .overlay(
                                    ZStack {
                                        Image("rockSign")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: screenWidth*0.025)
                                        Text("\(resourcesArray[row][col].stone)/2")
                                            .font(Font.custom("PassionOne-Regular", size: screenWidth*0.009))
                                            .foregroundColor(.white)
                                            .offset(y: screenWidth*0.003)
                                    }
                                        .offset(x: screenWidth*0.02, y: -screenWidth*0.01)
                                )
                                .offset(x: cageArray[row][col].offsetX * screenWidth/880, y: cageArray[row][col].offsetY * screenWidth/880)
                                .opacity(cageArray[row][col].lineColor == 1 ? 0 : 1)
                        }
                        if resourcesArray[row][col].thread != 0 {
                            Image("threadCage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth*0.08)
                                .overlay(
                                    ZStack {
                                        Image("threadSign")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: screenWidth*0.025)
                                        Text("\(resourcesArray[row][col].thread)/2")
                                            .font(Font.custom("PassionOne-Regular", size: screenWidth*0.009))
                                            .foregroundColor(.white)
                                            .offset(y: screenWidth*0.003)
                                    }
                                        .offset(x: screenWidth*0.02, y: -screenWidth*0.01)
                                )
                                .offset(x: cageArray[row][col].offsetX * screenWidth/880, y: cageArray[row][col].offsetY * screenWidth/880)
                                .opacity(cageArray[row][col].lineColor == 1 ? 0 : 1)
                        }
                        Rectangle()
                            .stroke(lineWidth: cageArray[row][col].lineWidth)
                            .frame(width: screenWidth*0.08, height: screenWidth*0.057)
                            .foregroundColor(cageArray[row][col].lineColor == 1 ? .black : .green)
                            .blur(radius: 3)
                            .offset(x: cageArray[row][col].offsetX * screenWidth/880, y: cageArray[row][col].offsetY * screenWidth/880)
                            .mask {
                                Image("emptyCage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: screenWidth*0.076)
                                    .offset(x: cageArray[row][col].offsetX * screenWidth/880, y: cageArray[row][col].offsetY * screenWidth/880)
                            }
                        
                    }
                    .onTapGesture {
                        makeStep(row: row, col: col)
                    }
                }
            }
            VStack(alignment: .leading) {
                Image("camp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.09)
                Image("buttonFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.16)
                    .overlay {
                        Text(gameTextArray[languageIndex][1])
                            .font(Font.custom("PassionOne-Regular", size: screenWidth*0.02))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)
                            .shadow(color: .black, radius: 2)
                    }
                    .onTapGesture {
                        collectResourses()
                    }
                    .opacity(collectButtonOpacity)
            }
            .offset(x: -screenWidth*0.4, y: -screenWidth*0.02)
            
            ForEach(0..<menInGameArray.count, id: \.self) { item in
                MenAnimate(animate: $menInGameArray[item].animate)
                    .scaleEffect(x: menInGameArray[item].sideLeft)
                    .offset(x: menInGameArray[item].offsetX * screenWidth/880, y: menInGameArray[item].offsetY * screenWidth/880)
                    .shadow(color: .white, radius: menInGameArray[item].shadowRadius)
                    .onTapGesture {
                        selectMen(item: item)
                    }
            }
            if !missionComplete {
                ZStack {
                    if woodCount == 0 && stoneCount == 0 && threadCount == 0 {
                        Image("basket")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.07)
                    } else {
                        Image("basketFull")
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.07)
                    }
                    BuildingProccess()
                        .opacity(buildingOpacity)
                }
                .offset(x: -screenWidth*0.34, y: screenWidth*0.11)
            } else {
                Image(targetImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: screenWidth*0.1, maxHeight: screenWidth*0.1)
                    .offset(x: -screenWidth*0.34, y: screenWidth*0.1)
            }
            HStack {
                ForEach(0..<menInGameArray.count, id: \.self) { item in
                    Image(persSign)
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth*0.032)
                        .shadow(color: .white, radius: menInGameArray[item].shadowRadius)
                        .overlay(
                            Circle()
                                .frame(width: screenWidth*0.015)
                                .foregroundColor(menInGameArray[item].status == 0 ? .green : menInGameArray[item].status == 1 ? .red : Color("darkText"))
                                .offset(y: -screenWidth*0.016)
                                .shadow(color: .black, radius: 1)
                                .shadow(color: .black, radius: 1)
                        )
                        .onTapGesture {
                            selectMen(item: item)
                        }
                }
                Spacer()
                Image("buttonFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth*0.16)
                    .overlay {
                        Text(gameTextArray[languageIndex][0])
                            .font(Font.custom("PassionOne-Regular", size: screenWidth*0.02))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)
                            .shadow(color: .black, radius: 2)
                    }
                    .onTapGesture {
                        endGame()
                    }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .frame(maxWidth: screenWidth*0.95)
            .padding(.bottom)
            Color.black.opacity(darkShadowOpacity).ignoresSafeArea()
            if pauseTapped {
                Pause(pauseTapped: $pauseTapped)
            }
            if youWin {
                YouWin(woodCount: $woodCount, woodTarget: $woodTarget, stoneCount: $stoneCount, stoneTarget: $stoneTarget, threadCount: $threadCount, threadTarget: $threadTarget, steps: $steps, menCount: $menCount, menRemainingCount: $menRemainingCount)
            }
            if youLose {
                YouLose(woodCount: $woodCount, woodTarget: $woodTarget, stoneCount: $stoneCount, stoneTarget: $stoneTarget, threadCount: $threadCount, threadTarget: $threadTarget, steps: $steps, menCount: $menCount, menRemainingCount: $menRemainingCount)
            }
        }
        
        .onChange(of: menInGameArray) { _ in
            if checkCompleteStep() {
                for i in 0..<menInGameArray.count {
                    if menInGameArray[i].status != 2 {
                        menInGameArray[i].status = 0
                    }
                }
                steps += 1
            }
        }
        
        .onChange(of: pauseTapped) { _ in
            if !pauseTapped {
                hideDarknessAnimation()
            }
        }
        
        .onAppear  {
            changePersSign()
            updateMenArray()
        }
        
    }
    
    func updateMenArray() {
        menInGameArray = Array(menInGameArray.prefix(menCount))
        
    }
    
    func endGame() {
        canMakeStep = false
        canChose = false
        for i in 0..<menInGameArray.count {
            menInGameArray[i].blinkTimer?.invalidate()
            menInGameArray[i].blinkTimer = nil
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                menInGameArray[i].shadowRadius = 0
            }
        }
        hideCollectButtonAnimation()
        withAnimation(Animation.easeInOut(duration: 0.5)) {
            buildingOpacity = 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                buildingOpacity = 0
            }
            if woodCount >= woodTarget && stoneCount >= stoneTarget && threadCount >= threadTarget {
                missionComplete = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showDarknessAnimation()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        youWin = true
                    }
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showDarknessAnimation()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        youLose = true
                    }
                }
            }
        }
    }
    
    func changePersSign() {
        switch selectedSkin {
        case 0:
            persSign = "persFrame"
        case 1:
            persSign = "persFrame2"
        case 2:
            persSign = "persFrame3"
        case 3:
            persSign = "persFrame4"
        default:
            break
        }
    }
    
    func showDarknessAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.5)) {
            darkShadowOpacity = 0.5
        }
    }
    
    func hideDarknessAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.5)) {
            darkShadowOpacity = 0
        }
    }
    
    func showCollectButtonAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.5)) {
            collectButtonOpacity = 1
        }
    }
    
    func hideCollectButtonAnimation() {
        withAnimation(Animation.easeInOut(duration: 0.5)) {
            collectButtonOpacity = 0
        }
    }
    
    func collectResourses() {
        if resourcesArray[menInGameArray[selectedMenIndex].yPosition][menInGameArray[selectedMenIndex].xPosition].stone != 0 {
            resourcesArray[menInGameArray[selectedMenIndex].yPosition][menInGameArray[selectedMenIndex].xPosition].stone -= 1
            stoneCount += 1
        }
        if resourcesArray[menInGameArray[selectedMenIndex].yPosition][menInGameArray[selectedMenIndex].xPosition].wood != 0 {
            resourcesArray[menInGameArray[selectedMenIndex].yPosition][menInGameArray[selectedMenIndex].xPosition].wood -= 1
            woodCount += 1
        }
        if resourcesArray[menInGameArray[selectedMenIndex].yPosition][menInGameArray[selectedMenIndex].xPosition].thread != 0 {
            resourcesArray[menInGameArray[selectedMenIndex].yPosition][menInGameArray[selectedMenIndex].xPosition].thread -= 1
            threadCount += 1
        }
        menInGameArray[selectedMenIndex].status = 1
        for i in 0..<menInGameArray.count {
            menInGameArray[i].blinkTimer?.invalidate()
            menInGameArray[i].blinkTimer = nil
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                menInGameArray[i].shadowRadius = 0
            }
        }
        hideCollectButtonAnimation()
    }
    
    func testBlink() {
        for i in 0..<cageArray.count {
            for j in 0..<cageArray[i].count {
                if i == 0 {
                    cageArray[i][j].scaleTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        withAnimation(Animation.easeInOut(duration: 0.5)) {
                            cageArray[i][j].lineWidth = 5
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(Animation.easeInOut(duration: 0.5)) {
                                cageArray[i][j].lineWidth = 1
                            }
                        }
                    }
                }
            }
        }
    }
    
    func addPossibleSteps(row: Int, col: Int) {
        if col > 0 && col < 5 {
            cageArray[row][col-1].lineColor = 2
            cageArray[row][col+1].lineColor = 2
        } else if col == 0 {
            cageArray[row][col+1].lineColor = 2
        } else if col == 5 {
            cageArray[row][col-1].lineColor = 2
        }
        if row > 0 && row < 5 {
            cageArray[row-1][col].lineColor = 2
            cageArray[row+1][col].lineColor = 2
        } else if row == 0 {
            cageArray[row+1][col].lineColor = 2
        } else if row == 5 {
            cageArray[row-1][col].lineColor = 2
        }
    }
    
    func checkCompleteStep() -> Bool {
        return menInGameArray.filter { $0.status == 0}.isEmpty
    }
    
    func calculateWalkingTime(row: Int, col: Int) -> Double {
        var walkingTime = 0.0
        walkingTime = abs(cageArray[row][col].offsetX - menInGameArray[selectedMenIndex].offsetX)/70 +
        abs(cageArray[row][col].offsetY - menInGameArray[selectedMenIndex].offsetY)/50
        return walkingTime
    }
    
    func makeStep(row: Int, col: Int) {
        if canMakeStep && cageArray[row][col].lineColor == 2{
            let walkingTime = calculateWalkingTime(row: row, col: col)
            canChose = false
            canMakeStep = false
            if cageArray[row][col].offsetX < menInGameArray[selectedMenIndex].offsetX {
                menInGameArray[selectedMenIndex].sideLeft = -1
            } else {
                menInGameArray[selectedMenIndex].sideLeft = 1
            }
            menInGameArray[selectedMenIndex].animate = true
            withAnimation(Animation.linear(duration: walkingTime)) {
                menInGameArray[selectedMenIndex].offsetX = cageArray[row][col].offsetX
                menInGameArray[selectedMenIndex].offsetY = cageArray[row][col].offsetY
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + walkingTime) {
                addPossibleSteps(row: row, col: col)
                canChose = true
                menInGameArray[selectedMenIndex].animate = false
                menInGameArray[selectedMenIndex].status = 1
                menInGameArray[selectedMenIndex].xPosition = col
                menInGameArray[selectedMenIndex].yPosition = row
                print( menInGameArray[selectedMenIndex].yPosition)
                print( menInGameArray[selectedMenIndex].xPosition)
                for i in 0..<menInGameArray.count {
                    menInGameArray[i].blinkTimer?.invalidate()
                    menInGameArray[i].blinkTimer = nil
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        menInGameArray[i].shadowRadius = 0
                    }
                }
            }
        }
    }
    
    func selectMen(item: Int) {
        if menInGameArray[item].status == 0 && canChose {
            selectedMenIndex = item
            if resourcesArray[menInGameArray[selectedMenIndex].yPosition][menInGameArray[selectedMenIndex].xPosition].stone != 0 || resourcesArray[menInGameArray[selectedMenIndex].yPosition][menInGameArray[selectedMenIndex].xPosition].wood != 0 || resourcesArray[menInGameArray[selectedMenIndex].yPosition][menInGameArray[selectedMenIndex].xPosition].thread != 0
            {
                showCollectButtonAnimation()
            } else {
                hideCollectButtonAnimation()
            }
            canMakeStep = true
            for i in 0..<menInGameArray.count {
                menInGameArray[i].blinkTimer?.invalidate()
                menInGameArray[i].blinkTimer = nil
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    menInGameArray[i].shadowRadius = 0
                }
            }
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                menInGameArray[selectedMenIndex].shadowRadius = 5
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    menInGameArray[selectedMenIndex].shadowRadius = 0
                }
            }
            menInGameArray[selectedMenIndex].blinkTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    menInGameArray[selectedMenIndex].shadowRadius = 5
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        menInGameArray[selectedMenIndex].shadowRadius = 0
                    }
                }
            }
        }
    }
    
}

#Preview {
    Game()
}
