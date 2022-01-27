//
//  ContentView.swift
//  memorize
//
//  Created by Scott Hardin on 12/26/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = [["🥶", "😈", "👺", "💩", "👾", "🤥", "😮‍💨", "🤮", "🤯", "😱", "😨", "🤩","🥳", "😏"]
    ,["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐"]
    ,["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨"]]
    @State var emojiCount = 0
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text("Memorize!").font(.largeTitle)
                Spacer()
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2 / 3, contentMode: .fit)
                    }
                }
            }
                    .foregroundColor(.red)
            Spacer()
            HStack {
                animals
                Spacer()
                cars
                Spacer()
                faces
            }
            .font(.largeTitle)
            .padding(.horizontal)
    }
                .padding(.horizontal)

}
var faces: some View {
    Button{
        emojis[0].shuffle()
        emojiCount = 0
    } label: {Image(systemName: "face.smiling")}
}
    var cars: some View {
        Button {
            emojis[1].shuffle()
            emojiCount = 1
        } label: {
            Image(systemName: "car.circle")
        }
    }
    var animals: some View{
        Button{
            emojis[2].shuffle()
            emojiCount = 2
        } label: {
            Image(systemName: "pawprint.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                    shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
};

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
