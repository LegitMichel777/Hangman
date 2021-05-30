//
//  animatedXmark.swift
//  Hangman
//
//  Created by LegitMichel777 on 2021/5/30.
//

import SwiftUI

struct animatedXmark: View {
    var percentage: CGFloat = .zero
    var body: some View {
        GeometryReader { geo in
            let dim=min(geo.size.height, geo.size.width)
            let cornerOffset:CGFloat=0.057
            Path { path in
                path.move(to: .init(x: dim*cornerOffset, y: dim*cornerOffset))
                path.addLine(to: .init(x: dim*(1.0-cornerOffset), y: dim*(1.0-cornerOffset)))
                path.move(to: .init(x: dim*(1.0-cornerOffset), y: dim*cornerOffset))
                path.addLine(to: .init(x: dim*cornerOffset, y: dim*(1.0-cornerOffset)))
            }.trim(from:0, to:percentage)
            .stroke(Color.black, style: StrokeStyle(lineWidth: dim*0.1, lineCap: .round, lineJoin: .round))
        }
    }
}

struct animatedXmark_Previews: PreviewProvider {
    static var previews: some View {
        animatedXmark(percentage: 1.0)
    }
}
