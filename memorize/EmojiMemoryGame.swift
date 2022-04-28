//
// Created by Scott Hardin on 2/21/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    private static var themeName: String = "Empty"
    private static var themeColor: [Double] = [0, 0, 0, 0]
    static var emojis: [MemoryGame<String>.Theme] = [
        MemoryGame.Theme(id: 0, themeName: "faces", themeColor: [1,0,0,1], themeContent: ["🥶", "😈", "👺", "💩", "👾", "🤥", "😮‍💨", "🤮", "🤯", "😱", "😨", "🤩","🥳", "😏"]),
        MemoryGame.Theme(id: 1, themeName: "cars", themeColor: [0,1,0,1], themeContent: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻"]),
        MemoryGame.Theme(id: 2, themeName: "animals", themeColor: [0,0,1,1], themeContent: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨"]),
        MemoryGame.Theme(id: 3, themeName: "fruit", themeColor: [1,0,1,1], themeContent: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐"]),
        MemoryGame.Theme(id: 4, themeName: "vegetables", themeColor: [1,1,0,1], themeContent: ["🥦", "🥕", "🥬", "🥒", "🫑", "🧄"]),
        MemoryGame.Theme(id: 5, themeName: "sports", themeColor: [0,1,1,1], themeContent: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏"])
    ]

    static func createMemoryGame() -> MemoryGame<String>{
        var array = emojis.randomElement()!
            array.themeContent.shuffle()
            themeName = array.themeName
            themeColor = array.themeColor
            return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: emojis.count / 2..<emojis.count), createCardContent: { index in
                array.themeContent[index]
            })

    }

    @Published private var model: MemoryGame<String> = createMemoryGame()

    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }

    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }

    func newGame(){
        model = EmojiMemoryGame.createMemoryGame()
    }

    func getThemeName() -> String{
        EmojiMemoryGame.themeName
    }

    func getThemeColor() -> [Double]{
        EmojiMemoryGame.themeColor
    }

    func getScore() -> Int{
        model.getScore()
    }
}
