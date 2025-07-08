//
//  Model.swift
//  Mark T. Games
//
//  Created by Алкександр Степанов on 02.07.2025.
//

import Foundation

struct ShopItem {
    var name: String
    var cost: Int
}

struct CagePos: Equatable {
    var posX: CGFloat = 0
    var posY: CGFloat = 0
    var offsetX: CGFloat
    var offsetY: CGFloat
    var lineWidth: CGFloat = 3
    var lineColor = 1
    var canStepHere: Bool = false
    var scaleTimer: Timer? = nil
    var brokeIndex = 0
}

struct MenInGame: Equatable {
    var offsetX: CGFloat
    var offsetY: CGFloat
    var animate = false
    var status = 0
    var blinkTimer: Timer? = nil
    var shadowRadius: CGFloat = 0
    var sideLeft:CGFloat = 1
    var xPosition: Int = 5
    var yPosition: Int = 5
}

struct Resourses: Equatable {
    var wood: Int = 0
    var stone: Int = 0
    var thread: Int = 0
}


class Arrays {
    
    static var achievementsArray = ["achieve1","achieve2","achieve3","achieve4","achieve5",]
    
    static var level1ResursesArray = [
        [Resourses(),Resourses(),Resourses(wood: 2),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(thread: 2),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(stone: 2),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()]
    ]
    
    static var level2ResursesArray = [
        [Resourses(wood: 2),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(thread: 2),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(stone: 2),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()]
    ]
    
    static var level3ResursesArray = [
        [Resourses(thread: 2),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(wood: 1),Resourses(wood: 1),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(stone: 2),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()]
    ]
    
    static var level4ResursesArray = [
        [Resourses(wood: 2),Resourses(wood: 2),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(thread: 2),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(stone: 3),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()]
    ]
    
    static var level5ResursesArray = [
        [Resourses(),Resourses(),Resourses(wood: 2),Resourses(wood: 2),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(thread: 1),Resourses(),Resourses(),Resourses()],
        [Resourses(thread: 1),Resourses(stone: 2),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()],
        [Resourses(),Resourses(),Resourses(),Resourses(),Resourses(),Resourses()]
    ]
    
    static var levelsArray = [level1ResursesArray,level2ResursesArray,level3ResursesArray,level4ResursesArray,level5ResursesArray]
    
    static var menInGameArray: [MenInGame] = [
        MenInGame(offsetX: -300, offsetY: -33),
        MenInGame(offsetX: -280, offsetY: -33),
        MenInGame(offsetX: -260, offsetY: -33),
        MenInGame(offsetX: -240, offsetY: -33),
        MenInGame(offsetX: -220, offsetY: -33),
    ]
    
    static var coordinatesArray = [
        [CagePos(offsetX: -161 , offsetY: -83),CagePos(offsetX: -91, offsetY: -83),CagePos(offsetX: -21, offsetY: -83),CagePos(offsetX: 49, offsetY: -83),CagePos(offsetX: 119, offsetY: -83),CagePos(offsetX: 189, offsetY: -83)],
        [CagePos(offsetX: -161 , offsetY: -33, lineColor: 2),CagePos(offsetX: -91, offsetY: -33),CagePos(offsetX: -21, offsetY: -33),CagePos(offsetX: 49, offsetY: -33),CagePos(offsetX: 119, offsetY: -33),CagePos(offsetX: 189, offsetY: -33)],
        [CagePos(offsetX: -161 , offsetY: 16),CagePos(offsetX: -91, offsetY: 16),CagePos(offsetX: -21, offsetY: 16),CagePos(offsetX: 49, offsetY: 16),CagePos(offsetX: 119, offsetY: 16),CagePos(offsetX: 189, offsetY: 16)],
        [CagePos(offsetX: -161 , offsetY: 66),CagePos(offsetX: -91, offsetY: 66),CagePos(offsetX: -21, offsetY: 66),CagePos(offsetX: 49, offsetY: 66),CagePos(offsetX: 119, offsetY: 66),CagePos(offsetX: 189, offsetY: 66)],
        [CagePos(offsetX: -161 , offsetY: 116),CagePos(offsetX: -91, offsetY: 116),CagePos(offsetX: -21, offsetY: 116),CagePos(offsetX: 49, offsetY: 116),CagePos(offsetX: 119, offsetY: 116),CagePos(offsetX: 189, offsetY: 116)],
        [CagePos(offsetX: -161 , offsetY: 166),CagePos(offsetX: -91, offsetY: 166),CagePos(offsetX: -21, offsetY: 166),CagePos(offsetX: 49, offsetY: 166),CagePos(offsetX: 119, offsetY: 166),CagePos(offsetX: 189, offsetY: 166)]
    ]
    
    static var shopSkinArray = [
        ShopItem(name: "shopSkin1", cost: 1),
        ShopItem(name: "shopSkin2", cost: 100),
        ShopItem(name: "shopSkin3", cost: 300),
        ShopItem(name: "shopSkin4", cost: 500)
    ]
    
    static var shopBGArray = [
        ShopItem(name: "shopBG1", cost: 1),
        ShopItem(name: "shopBG2", cost: 100),
        ShopItem(name: "shopBG3", cost: 300),
        ShopItem(name: "shopBG4", cost: 500)
    ]
    
    static var men1SpritesArray = ["men1_1", "men1_2", "men1_3", "men1_4", "men1_5", "men1_6", "men1_7"]
    static var men2SpritesArray = ["men2_1", "men2_2", "men2_3", "men2_4", "men2_5", "men2_6", "men2_7"]
    static var men3SpritesArray = ["men3_1", "men3_2", "men3_3", "men3_4", "men3_5", "men3_6", "men3_7"]
    static var men4SpritesArray = ["men4_1", "men4_2", "men4_3", "men4_4", "men4_5", "men4_6", "men4_7"]
    
    static var languagesImage = ["englishLanguage", "frenchLanguage", "germanLanguage", "spainLanguage"]
    
    static var textArrayEnglishSettings = ["Settings","Sound","Language"]
    static var textArrayFrenchSettings = ["Paramètres","Son","Langue"]
    static var textArrayGermanSettings = ["Einstellungen","Ton","Sprache"]
    static var textArraySpanishSettings = ["Configuración","Sonido","Idioma"]
    
    static var settingsTextArray = [textArrayEnglishSettings, textArrayFrenchSettings, textArrayGermanSettings, textArraySpanishSettings]
    
    static var textArrayEnglishMainMenu = ["Start The Game", "Store", "Achievements", "Daily Quest"]
    static var textArrayFrenchMainMenu = ["Commencer Le Jeu", "Boutique", "Succès", "Quête Quotidienne"]
    static var textArrayGermanMainMenu = ["Spiel Starten", "Shop", "Erfolge", "Tägliche Aufgabe"]
    static var textArraySpanishMainMenu = ["Iniciar El Juego", "Tienda", "Logros", "Misión Diaria"]
    
    static var mainMenuTextArray = [textArrayEnglishMainMenu, textArrayFrenchMainMenu, textArrayGermanMainMenu, textArraySpanishMainMenu]
    
    static var textArrayEnglishShop = ["Store","Skin", "Background", "Selected", "Select", "Buy"]
    static var textArrayFrenchShop = ["Boutique", "Skin", "Arrière-plan", "Sélectionné", "Sélectionner", "Acheter"]
    static var textArrayGermanShop = ["Shop", "Skin", "Hintergrund", "Ausgewählt", "Auswählen", "Kaufen"]
    static var textArraySpanishShop = ["Tienda", "Skin", "Fondo", "Seleccionado", "Seleccionar", "Comprar"]
    
    static var shopTextArray = [textArrayEnglishShop, textArrayFrenchShop, textArrayGermanShop, textArraySpanishShop]
    
    static var textArrayEnglishSelectLevel = ["Level select","Level"]
    static var textArrayFrenchSelectLevel = ["Sélectionner le niveau","Niveau"]
    static var textArrayGermanSelectLevel = ["Level auswählen","Level"]
    static var textArraySpanishSelectLevel = ["Seleccionar nivel","Nivel"]
    
    static var selectLevelTextArray = [textArrayEnglishSelectLevel, textArrayFrenchSelectLevel, textArrayGermanSelectLevel, textArraySpanishSelectLevel]
    
    static var gameTextEnglish = ["End The Round", "Collect Resourses"]
    static var gameTextFrench = ["Terminer La Manche", "Collecter Les Ressources"]
    static var gameTextGerman = ["Runde Beenden", "Ressourcen Sammeln"]
    static var gameTextSpanish = ["Terminar La Ronda", "Recolectar Recursos"]
    
    static var gameTextArray = [gameTextEnglish, gameTextFrench, gameTextGerman, gameTextSpanish]
    
    static var pauseTexEnglishArray = ["Pause","Resume","Restart","Menu"]
    static var pauseTexFrenchArray = ["Pause","Reprendre","Redémarrer","Menu"]
    static var pauseTexGermanArray = ["Pause","Fortsetzen","Neustart","Menü"]
    static var pauseTexSpanishArray = ["Pausa","Reanudar","Reiniciar","Menú"]
    
    static var pauseTextArray = [pauseTexEnglishArray, pauseTexFrenchArray, pauseTexGermanArray, pauseTexSpanishArray]
    
    static var youWinTextEnglish = "You Win!"
    static var youWinTextFrench = "Vous Gagnez!"
    static var youWinTextGerman = "Du Gewinnst!"
    static var youWinTextSpanish = "¡Tú Ganas!"
    
    static var youWinTextArray: [String] = [youWinTextEnglish, youWinTextFrench, youWinTextGerman, youWinTextSpanish]
    
    static var youLoseTextEnglish = "You Lose"
    static var youLoseTextFrench = "Vous Perdez"
    static var youLoseTextGerman = "Du Verlierst"
    static var youLoseTextSpanish = "Tú Pierdes"
    
    static var youLoseTextArray: [String] = [youLoseTextEnglish, youLoseTextFrench, youLoseTextGerman, youLoseTextSpanish]
}
