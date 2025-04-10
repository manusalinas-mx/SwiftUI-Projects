//
//  ThreeColumnSplitView.swift
//

import SwiftUI

struct ThreeColumnSplitView: View {
    @State private var selectedCategoryId: MenuItem.ID?
    @State private var selectedItem: MenuItem?
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    
    private var dataProvider = MenuProvider()
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            mainMenuList()
        } content: {
            subMenuListOrEmpty()
        } detail: {
            detailViewOrEmpty()
        }
    }
    
    // MARK: - Function Views
    private func mainMenuList() -> some View {
        List(dataProvider.mainMenuItems, selection: $selectedCategoryId) { item in
            ListRowView(icon: item.icon, name: item.name)
        }
        .navigationTitle("Activities")
    }
    
    @ViewBuilder
    private func subMenuListOrEmpty() -> some View {
        if let selectedCategoryId,
           let subMenuItems = dataProvider.subMenuItems(for: selectedCategoryId) {
            List(subMenuItems, selection: $selectedItem) { item in
                NavigationLink(value: item) {
                    ListRowView(icon: item.icon, name: item.name)
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
        } else {
            EmptyStateView()
        }
    }
    
    @ViewBuilder
    private func detailViewOrEmpty() -> some View {
        if let selectedItem {
            ImageDetailView(icon: selectedItem.icon)
        } else {
            EmptyStateView()
        }
    }
}

#Preview {
    ThreeColumnSplitView()
}
