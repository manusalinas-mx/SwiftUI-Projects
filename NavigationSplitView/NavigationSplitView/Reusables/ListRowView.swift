//
//  ListRowView.swift
//  NavigationSplitView
//
//  Created by Manuel Salinas on 10/04/25.
//
import SwiftUI

struct ListRowView: View {
    let icon: String
    let name: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Text(name)
                .font(.system(.title3, design: .rounded))
                .bold()
        }
    }
}

#Preview {
    ListRowView(
        icon: "person.circle",
        name: "Manu")
}
