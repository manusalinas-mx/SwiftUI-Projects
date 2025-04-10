//
//  EmptyStateView.swift
//  NavigationSplitView
//
//  Created by Manuel Salinas on 10/04/25.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        ContentUnavailableView(
            "Please select an item",
            systemImage: "note",
            description: Text("No Selection")
        )
    }
}

#Preview {
    EmptyStateView()
}
