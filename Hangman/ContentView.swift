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
        VStack(spacing:0) {
            Text("Hangman")
                .font(.largeTitle)
                .bold()
                .padding(.top,20)
            Image(engine.currentImage)
                .resizable()
                .scaledToFit()
                .padding(.top,15)
            Spacer()
            Text("Guess The Word")
                .font(.system(size: 32, weight: .semibold, design: .default))
            guessSpaces(str: "S_R_H")
                .padding(.horizontal,32)
                .padding(.bottom,27)
            keyboard(engine: engine)
                .padding(.bottom,40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(engine: hmEngine())
    }
}
