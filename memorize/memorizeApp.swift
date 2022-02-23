//
//  memorizeApp.swift
//  memorize
//
//  Created by Scott Hardin on 12/26/21.
//

import SwiftUI

@main
struct memorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
