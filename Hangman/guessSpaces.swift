//
//  guessSpaces.swift
//  Hangman
//
//  Created by LegitMichel777 on 2021/5/30.
//

import SwiftUI

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

struct guessSpaces: View {
    var str: String // use _ for those that haven't been filled out yet
    var body: some View {
        HStack(alignment: .bottom, spacing:11) {
            ForEach((0..<str.count), id:\.self) { index in
                GeometryReader { geo in
                    VStack(spacing:0) {
                        Spacer()
                        Text(str[index]=="_" ? " " : String(str[index]))
                            .font(.system(size: min(geo.size.width*0.6,40.0), weight: .medium, design: .default))
                        Capsule(style: .continuous)
                            .frame(height:4)
                            .foregroundColor(.init("spaces"))
                    }
                }
            }
        }.frame(height:75,alignment: .bottom)
    }
}

struct guessSpaces_Previews: PreviewProvider {
    static var previews: some View {
        guessSpaces(str: "WHAT")
    }
}
