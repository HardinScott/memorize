//
//  memorizeApp.swift
//  memorize
//
//  Created by Scott Hardin on 12/26/21.
//

import SwiftUI

@main
struct memorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
