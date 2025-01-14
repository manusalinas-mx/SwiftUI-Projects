//
//  App_WishlistApp.swift
//  App-Wishlist
//
//  Created by Manuel Salinas on 1/13/25.
//

import SwiftUI
import SwiftData

@main
struct App_WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
