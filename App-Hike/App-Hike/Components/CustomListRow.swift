//
//  CustomListRow.swift
//  App-Hike
//
//  Created by Manuel Salinas on 1/10/25.
//

import SwiftUI

struct CustomListRow: View {
    @State var title: String
    @State var icon: String
    @State var content: String? = nil
    @State var tintColor: Color
    @State var link: String? = nil
    @State var linkDestination: String? = nil

    var body: some View {
        LabeledContent {
            if let content {
                Text(content)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)

            }  else if let link, let linkDestination {
                Link(link, destination: URL(string: linkDestination)!)
                    .foregroundStyle(.pink)
                    .fontWeight(.heavy)

            } else {
                EmptyView()
            }

        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(tintColor)

                    Image(systemName: icon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .fontWeight(.semibold)
                }

                Text(title)
            }
        }
    }
}

#Preview {
    List{
        CustomListRow(
            title: "Car",
            icon: "car.fill",
            content: "Volvo XC90",
            tintColor: .red)

        CustomListRow(
            title: "Website",
            icon: "globe",
            tintColor: .blue,
            link: "Apple",
            linkDestination: "https://www.apple.com")
    }
}
