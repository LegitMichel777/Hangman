//
//  ContentView.swift
//  Hangman
//
//  Created by LegitMichel777 on 2021/5/29.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var engine: hmEngine
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(engine: hmEngine())
    }
}
