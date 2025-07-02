//
//  Coordinator.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import Foundation
import SwiftUI

enum CoordinatorView: Equatable {
    case loading
    case mainMenu
    case settings
    case game
    case choseLevel
    case shop
    case bonus
    case quest
    case achievements
}

final class Coordinator: ObservableObject {
    @Published var path: [CoordinatorView] = []
    
    func resolve(pathItem: CoordinatorView) -> AnyView {
        var view = AnyView(Loading())
        switch pathItem {
        case .loading:
            view = AnyView(Loading())
        case .mainMenu:
            view = AnyView(MainMenu())
        case .game:
            view = AnyView(Game())
        case .settings:
            view = AnyView(Settings())
        case .choseLevel:
            view = AnyView(SelectLevel())
        case .shop:
            view = AnyView(Shop())
        case .bonus:
            view = AnyView(DailyReward())
        case .quest:
            view = AnyView(DailyQuest())
        case .achievements:
            view = AnyView(Achievements())
            
        }
        return view
    }
    
    func navigate(to pathItem: CoordinatorView) {
        path.append(pathItem)
    }
    
    func navigateBack() {
        _ = path.popLast()
    }
}

struct ContentView: View {
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        ZStack {
            coordinator.resolve(pathItem: coordinator.path.last ?? .loading)
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    ContentView()
}







