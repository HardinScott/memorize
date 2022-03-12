//
// Created by Scott Hardin on 2/21/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    static var emojis = ["🥶", "😈", "👺", "💩", "👾", "🤥", "😮‍💨", "🤮", "🤯", "😱", "😨", "🤩","🥳", "😏"
                  ,"🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻"
                  ,"🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨"]

    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: Int.random(in: emojis.count/4..<emojis.count/2), createCardContent: { index in
            emojis[index]
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

    func getScore() -> Int{
        model.getScore()
    }
}
