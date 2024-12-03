//
//  CustomNavigationBarStyle.swift
//

import SwiftUI

struct CustomNavigationBarStyle: ViewModifier {
    var title: String?
    var inLine: Bool = true

    func body(content: Content) -> some View {
        content
            .navigationTitle(title ?? "")
            .toolbarTitleDisplayMode(inLine ?  .inline : .automatic)
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}
