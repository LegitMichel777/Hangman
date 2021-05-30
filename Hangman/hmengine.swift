//
//  hmengine.swift
//  Hangman
//
//  Created by LegitMichel777 on 2021/5/29.
//

import Foundation

class hmEngine: ObservableObject {
    @Published var currentImage="HM-Complete"
    func handleInput(_ keyPressed: String) {
        print("Handle the input \(keyPressed)")
    }
}
