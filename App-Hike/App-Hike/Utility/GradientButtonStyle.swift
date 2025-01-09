//
//  GradientButtonStyle.swift
//  App-Hike
//
//  Created by Manuel Salinas on 1/9/25.
//


import SwiftUI
struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed
                ?
                LinearGradient(
                    colors: [
                        .colorGrayMedium,
                        .colorGrayLight
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )

                :
                    LinearGradient(
                        colors: [
                            .colorGrayLight,
                            .colorGrayMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
            )
            .cornerRadius(40)
    }
}
