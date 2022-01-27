//
//  ContentView.swift
//  memorize
//
//  Created by Scott Hardin on 12/26/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = [["🥶", "😈", "👺", "💩", "👾", "🤥", "😮‍💨", "🤮", "🤯", "😱", "😨", "🤩","🥳", "😏"]
    ,["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻"]
    ,["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨"]]
    @State var emojiCount = 0
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text("Hello Adrii").font(.largeTitle)
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
    VStack {
        Button {
            emojis[0].shuffle()
            emojiCount = 0
        } label: {
            Image(systemName: "face.smiling")
        }
        Text("Faces").font(.system(size: 10))
    }
}
    var cars: some View {
        VStack {
            Button {
                emojis[1].shuffle()
                emojiCount = 1
            } label: {
                Image(systemName: "car.circle")
            }
            Text("Cars").font(.system(size: 10))
        }
    }
    var animals: some View{
        VStack {
            Button {
                emojis[2].shuffle()
                emojiCount = 2
            } label: {
                Image(systemName: "pawprint.circle")
            }
            Text("Animals").font(.system(size: 10))
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
