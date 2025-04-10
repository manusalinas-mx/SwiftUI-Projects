//
//  TwoColumnSplitView.swift
//

import SwiftUI

struct TwoColumnSplitView: View {
    private var dataProvider = MenuProvider()
    
    @State private var selectedCategoryId: MenuItem.ID?
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(dataProvider.mainMenuItems, selection: $selectedCategoryId) { item in
                ListRowView(icon: item.icon, name: item.name)
            }
            .navigationTitle("Activitites")
        } detail: {
            if let selectedCategoryId,
               let categoryItems = dataProvider.subMenuItems(for: selectedCategoryId) {
                
                List(categoryItems) { item in
                    ListRowView(icon: item.icon, name: item.name)
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Detail")
                
            } else {
                EmptyStateView()
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    TwoColumnSplitView()
}
