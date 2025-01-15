//
//  HomeView.swift
//  App-Restart
//
//  Created by Manuel Salinas on 1/14/25.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - HEADER
            Spacer()

            ZStack {
                RingsView(shapeColor: .gray, shapeOpacity: 0.1)

                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 3).repeatForever(), value: isAnimating)
            }

            // MARK: - BODY
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            // MARK: - FOOTER
            Spacer()

            Button {
                playSound(sound: "success", type: "m4a")
                isOnboardingViewActive = true
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)

                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)

            } //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)

        } //: VSTACK
        .padding()
        .onAppear {
            // Animate if user does nothing after 3 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    HomeView()
}
