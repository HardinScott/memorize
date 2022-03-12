//
// Created by Scott Hardin on 2/21/22.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>

    private var indexOfFaceUpCard: Int?

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()

        for i in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(i)
            cards.append(Card(id: i*2, content: content))
            cards.append(Card(id: i*2+1, content: content))
        }
    }

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
                if let potentialMatch = indexOfFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatch].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatch].isMatched = true
                    }
                    indexOfFaceUpCard = nil
                } else{
                    for index in cards.indices{
                        cards[index].isFaceUp = false
                    }
                    indexOfFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp.toggle()
        }
    }

    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}