//
//  CustomBackgroundView.swift
//  App-Hike
//
//  Created by Manuel Salinas on 1/9/25.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // 3. Depth
            Color(.colorGreenDark)
                .cornerRadius(40)
                .offset(y: 12)

            // 2. Light
            Color(.colorGreenLight)
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)

            // 1. Surface
            LinearGradient(
                colors: [
                    .colorGreenLight,
                    .colorGreenMedium
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
