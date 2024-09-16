//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Neel Arora on 9/1/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiGameView(viewModel: game)
        }
    }
}
