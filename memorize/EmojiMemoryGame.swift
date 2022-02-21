//
// Created by Scott Hardin on 2/21/22.
//

import SwiftUI

class EmojiMemoryGame{
    static let emojis = ["🥶", "😈", "👺", "💩", "👾", "🤥", "😮‍💨", "🤮", "🤯", "😱", "😨", "🤩","🥳", "😏"
                  ,"🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻"
                  ,"🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨"]

    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: { index in
            emojis[index]
        })
    }

    private var model: MemoryGame<String> = createMemoryGame()

    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
}
