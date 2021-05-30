//
//  keyboard.swift
//  Hangman
//
//  Created by LegitMichel777 on 2021/5/29.
//

import SwiftUI

let keyboardLayout=[["Q","W","E","R","T","Y","U","I","O","P"],["A","S","D","F","G","H","J","K","L"],["Z","X","C","V","B","N","M"]]

struct MaximumWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct DetermineWidth: View {
    typealias Key = MaximumWidthPreferenceKey
    var body: some View {
        GeometryReader {
            proxy in
            Color.clear
                .anchorPreference(key: Key.self, value: .bounds) {
                    anchor in proxy[anchor].size.width
                }
        }
    }
}

enum KeyStatus {
    case enabled
    case crossedOut
    case checkmark
    case disabled
}

struct indivKey: View {
    var key: String
    var keyStatus: KeyStatus
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 5)
                .frame(height:46)
                .foregroundColor(.init("keyShadow"))
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height:44)
                    .foregroundColor(.init("key"))
                Text(key)
                    .font(.system(size: 18, weight: .regular, design: .default))
            }
        }
        
    }
}

struct keyboard: View {
    @State var maxWidth: CGFloat = 0
    var engine: hmEngine
    var body: some View {
        let betweenKeyDiff: CGFloat = 6
        let betweenRowDiff: CGFloat = 7
        VStack(spacing: betweenRowDiff) {
            HStack(spacing:betweenKeyDiff) {
                ForEach((0..<keyboardLayout[0].count)) { index2 in
                    indivKey(key: keyboardLayout[0][index2], keyStatus: .enabled)
                        .overlay(DetermineWidth())
                }
            }
            ForEach((1..<keyboardLayout.count), id: \.self) { index1 in
                HStack(spacing: betweenKeyDiff) {
                    ForEach((0..<keyboardLayout[index1].count)) { index2 in
                        indivKey(key: keyboardLayout[index1][index2], keyStatus: .enabled)
                            .frame(width:maxWidth)
                    }
                }
            }
        }.onPreferenceChange(DetermineWidth.Key.self) {
            maxWidth=$0
        }.padding(.horizontal,7)
    }
}

struct keyboard_Previews: PreviewProvider {
    static var previews: some View {
        keyboard(engine: hmEngine())
    }
}
