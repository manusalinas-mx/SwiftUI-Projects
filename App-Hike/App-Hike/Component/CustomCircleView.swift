//
//  CustomCircleView.swift
//  App-Hike
//
//  Created by Manuel Salinas on 1/9/25.
//

import SwiftUI

struct CustomCircleView: View {

    @State private var isAnimnateGradient = false

    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .colorIndigoMedium,
                            .colorSalmonLight
                        ],
                        startPoint: isAnimnateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimnateGradient ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimnateGradient.toggle()
                    }
                }

            MotionAnimationView()
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        
        CustomCircleView()
    }
}
