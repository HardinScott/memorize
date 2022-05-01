//
// Created by Scott Hardin on 2/21/22.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private var score: Int
    private var indexOfFaceUpCard: Int?
    private var seenCards: [Int]

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        score = 0
        seenCards = [Int]()
        for i in 0..<numberOfPairsOfCards{
            let content: CardContent = createCardContent(i)
            cards.append(Card(id: i*2, content: content))
            cards.append(Card(id: i*2+1, content: content))
        }
        cards.shuffle()
    }

    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
                if let potentialMatch = indexOfFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatch].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatch].isMatched = true
                        addScore(amount: 2)
                    } else{
                        if beenSeen(cards[chosenIndex]) {
                            reduceScore(amount: 1)
                        }
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

    func getScore() -> Int {
        score
    }

    mutating func addScore(amount: Int){
        score += amount
    }

    mutating func reduceScore(amount: Int){
        score -= amount
    }

    mutating func beenSeen(_ card: Card) -> Bool{
        if seenCards.contains(card.id){
            return true
        } else{
            seenCards.append(card.id)
            return false
        }
    }

    struct Card: Identifiable{
        let id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }

    struct Theme: Identifiable {
        let id: Int
        let themeName: String
        let themeColor: [Double]
        var themeContent: [CardContent]
    }
}
