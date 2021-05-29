//
//  HangmanApp.swift
//  Hangman
//
//  Created by LegitMichel777 on 2021/5/29.
//

import SwiftUI

@main
struct HangmanApp: App {
    var body: some Scene {
        WindowGroup {
            let engine=hmEngine()
            ContentView(engine: engine)
        }
    }
}
