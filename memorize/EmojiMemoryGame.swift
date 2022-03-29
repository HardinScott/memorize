//
// Created by Scott Hardin on 2/21/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
//    static var emojis = ["🥶", "😈", "👺", "💩", "👾", "🤥", "😮‍💨", "🤮", "🤯", "😱", "😨", "🤩","🥳", "😏"
//                  ,"🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻"
//                  ,"🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨"]
    enum themes: CaseIterable{
        case faces
        case cars
        case animals
        case fruit
    }

    static var emojiMap = [
        EmojiMemoryGame.themes.faces: ["🥶", "😈", "👺", "💩", "👾", "🤥", "😮‍💨", "🤮", "🤯", "😱", "😨", "🤩","🥳", "😏"],
        EmojiMemoryGame.themes.cars: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻"],
        EmojiMemoryGame.themes.animals: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨"],
        EmojiMemoryGame.themes.fruit: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐"]
    ]

    static func createMemoryGame() -> MemoryGame<String>{
        if let array = EmojiMemoryGame.themes.allCases.randomElement() {
            var emojis = emojiMap[array]!
            emojis.shuffle()
            return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: emojis.count / 2..<emojis.count), createCardContent: { index in
                emojis[index]
            })
        } else {
            var emojis = ["🥶", "😈", "👺", "💩", "👾", "🤥", "😮‍💨", "🤮", "🤯", "😱", "😨", "🤩","🥳", "😏"]
            emojis.shuffle()
            return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: emojis.count / 4..<emojis.count / 2), createCardContent: { index in
                emojis[index]
            })
        }
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

    func getScore() -> Int{
        model.getScore()
    }
}
