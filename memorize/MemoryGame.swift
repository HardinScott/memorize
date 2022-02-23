//
// Created by Scott Hardin on 2/21/22.
//

import Foundation


struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()

        for i in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(i)
            cards.append(Card(id: i*2, content: content))
            cards.append(Card(id: i*2+1, content: content))
        }
    }

    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }

    func index(of card: Card) -> Int{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return 0
    }

    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}