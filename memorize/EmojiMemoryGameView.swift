//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by Scott Hardin on 12/26/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            HStack{
                Spacer()
                HStack {
                    Button("New Game", action: viewModel.newGame)
                    VStack {
                        Text("Hello Adrii").font(.largeTitle)
                        Text(viewModel.getThemeName()).font(.largeTitle)
                    }
                    Text("Score: \(viewModel.getScore())")
                }
                Spacer()
            }
            ScrollView {
                GeometryReader(content: {geometry in
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: (geometry.size.width / CGFloat(viewModel.cards.count) * 1.9)))]) {
                        ForEach(viewModel.cards) { card in
                            CardView(card: card)
                                    .aspectRatio(2 / 3, contentMode: .fill)
                                    .onTapGesture{
                                        viewModel.choose(card)
                                    }
                        }
                    }
                })
            }
                    .foregroundColor(Color(UIColor(displayP3Red: viewModel.getThemeColor()[0], green: viewModel.getThemeColor()[1], blue: viewModel.getThemeColor()[2], alpha: viewModel.getThemeColor()[3])))
        }
                .padding(.horizontal)

    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader(content: {geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(Font.system(size: min(geometry.size.height, geometry.size.width)*0.85))
                } else if card.isMatched{
                    shape.opacity(0)
                }
                else {
                    shape.fill()
                }
            }
        })
    }
};

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game).preferredColorScheme(.dark)
    }
}
