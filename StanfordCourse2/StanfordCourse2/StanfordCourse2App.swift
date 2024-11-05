//
//  StanfordCourse2App.swift
//  StanfordCourse2
//
//  Created by Neel Arora on 10/28/24.


import SwiftUI

@main
struct StanfordCourse2App: App {
    @StateObject var game = Controller()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
