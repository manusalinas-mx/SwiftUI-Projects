//
//  RingsView.swift
//  App-Restart
//
//  Created by Manuel Salinas on 1/14/25.
//

import SwiftUI

struct RingsView: View {
    @State var shapeColor: Color
    @State var shapeOpacity: Double

    @State private var isAnimating: Bool = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity) ,lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)

            Circle()
                .stroke(shapeColor.opacity(shapeOpacity) ,lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0)
        .animation(.easeIn(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    ZStack {
        Color.accentColor
            .ignoresSafeArea()

        RingsView(shapeColor: .white, shapeOpacity: 0.2)
    }
}
