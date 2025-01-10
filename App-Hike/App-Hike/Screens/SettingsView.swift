//
//  SettingsView.swift
//  App-Hike
//
//  Created by Manuel Salinas on 1/10/25.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    private let alternateAppIcons: [String]  =  [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
    ]


    var body: some View {
        List {
            // MARK: - Section Header
            Section {
                HStack {
                    Spacer()

                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))

                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))

                        Text("Editor Choice")
                            .fontWeight(.medium)
                    }

                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))

                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .colorGreenLight,
                            .colorGreenMedium,
                            .colorGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)

                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)

                    Text("The hike wich looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best days hikes in the app")
                        .font(.footnote)
                        .italic()

                    Text("Dust off the boots.  It's time to walk!")
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)

            // MARK: - Section Icon
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(alternateAppIcons.indices, id: \.self) { index in
                            Button {
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[index]) { error in

                                    if let error {
                                        print("Error setting alternate icon: \(error.localizedDescription)")
                                    } else {
                                        print("Successfully set alternate icon")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[index])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)

                Text("Choose yoru favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } header: {
                Text("Alternate Icons")
            }
            .listRowSeparator(.hidden)


            // MARK: - Section About
            Section {
                CustomListRow(title: "Application", icon: "apps.iphone", content: "Hike", tintColor: .blue)
                CustomListRow(title: "Compatibility", icon: "info.circle", content: "iOS", tintColor: .red)
                CustomListRow(title: "Technology", icon: "swift", content: "Swift", tintColor: .orange)
                CustomListRow(title: "Version", icon: "gear", content: "1.0", tintColor: .purple)
                CustomListRow(title: "Developer", icon: "ellipsis.curlybraces", content: "Manu Salinas", tintColor: .mint)
                CustomListRow(title: "Designer", icon: "paintpalette", content: "Manu", tintColor: .pink)
                CustomListRow(title: "Website", icon: "globe", tintColor: .indigo, link: "Manuel's Page", linkDestination: "https://mxnuelsg.wordpress.com")

            } header: {
                Text("ABOUT THE APP")
            } footer: {
                Text("Copyright All © Ritghs Reserved")
            }

        }
    }
}

#Preview {
    SettingsView()
}
