//
//  CardView.swift
//  App-Hike
//
//  Created by Manuel Salinas on 1/9/25.
//

import SwiftUI

struct CardView: View {
    // MARK: Properties
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var showSheet: Bool = false

    // MARK: Functions
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber

                    imageNumber = randomNumber
    }

    var body: some View {
        // MARK: Card
        ZStack {
            CustomBackgroundView()

            VStack {
                // MARK: - Header

                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .colorGrayLight,
                                        .colorGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )

                        Spacer()

                        Button {
                            // action...
                            showSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $showSheet) {
                            SettingsView()
                                .presentationDetents([.large, .medium])
                        }

                    }

                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.colorGrayMedium)
                }
                .padding(.horizontal, 30)

                // MARK: - Main Content
                ZStack {
                    CustomCircleView()

                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }

                // MARK: - Footer
                Button {
                    // Code...
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .white,
                                    .colorGreenLight,
                                    .colorGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 1)
                }
                .buttonStyle(GradientButton())


            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
