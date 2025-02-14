//
//  OnboardingView.swift
//  App-Restart
//
//  Created by Manuel Salinas on 1/14/25.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true

    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0

    // Animations
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share"

    @State private var launchHaptic: Bool = false

    var body: some View {
        ZStack {
            Color.colorBlue
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // MARK: - HEADER
                Spacer()

                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .transition(.opacity)
                        .id(textTitle)

                    Text(
                        """
It's not how much we give but 
how much love we put into giving.
"""
                    )
                    .font(.title3.weight(.light))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeIn(duration: 1), value: isAnimating)


                // MARK: - BODY
                ZStack {
                    RingsView(shapeColor: .white, shapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeInOut(duration: 1), value: imageOffset)

                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                    // .opacity(isAnimating ? 1 : 0)
                        .scaleEffect(isAnimating ? 1 : 0.1)
                        .animation(.easeIn(duration: 1), value: isAnimating)
                        .offset(x: imageOffset.width + 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = value.translation

                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "Give"
                                        }
                                    }
                                }
                                .onEnded { _ in
                                    imageOffset = .zero

                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Share"
                                    }
                                }
                        )
                        .animation(.easeInOut(duration: 1), value: imageOffset)
                } //: BODY
                .overlay (
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundStyle(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .opacity(indicatorOpacity)
                        .animation(.easeInOut(duration: 1).delay(2), value: isAnimating)
                    , alignment: .bottom
                )

                Spacer()

                // MARK: - FOOTER
                ZStack {
                    // 1. Background (static)
                    Capsule()
                        .fill(.white.opacity(0.2))

                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    // 2. Call-To-Action (Static)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x: 20)

                    // 3. Capsule (Dynamic Width)
                    HStack {
                        Capsule()
                            .fill(.colorRed)
                            .frame(width: buttonOffset + 80)

                        Spacer()
                    }

                    // 4. Circle (Draggable)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(.colorRed)

                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)

                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if value.translation.width > 0
                                        && buttonOffset <= buttonWidth - 80{
                                        buttonOffset = value.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            launchHaptic = true
                                            playSound(sound: "chimeup", type: "mp3")
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            buttonOffset = 0
                                            launchHaptic = true
                                        }
                                    }
                                }
                        )//: GESTURE
                        .sensoryFeedback(.success, trigger: launchHaptic)

                        Spacer()
                    }//: HSTACK

                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeIn(duration: 1), value: isAnimating)
            } //: VSTACK
        } //: ZSTACK
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    OnboardingView()
}
