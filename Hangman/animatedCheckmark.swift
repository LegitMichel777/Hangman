//
//  animatedCheckmark.swift
//  Hangman
//
//  Created by LegitMichel777 on 2021/5/30.
//

import SwiftUI

struct animatedCheckmark: View {
    var percentage: CGFloat = .zero
    var body: some View {
        GeometryReader { geo in
            let dim=min(geo.size.height, geo.size.width)
            Path { path in
                path.move(to: .init(x: dim*0.0565, y: dim*0.5286))
                path.addLine(to: .init(x: dim*0.3794, y: dim*0.9455))
                path.addLine(to: .init(x: dim*0.9452, y: dim*0.0524))
            }.trim(from:0, to:percentage)
            .stroke(Color.black, style: StrokeStyle(lineWidth: dim*0.1, lineCap: .round, lineJoin: .round))
        }
    }
}

struct animatedCheckmark_Previews: PreviewProvider {
    static var previews: some View {
        animatedCheckmark(percentage: 0.8)
    }
}
