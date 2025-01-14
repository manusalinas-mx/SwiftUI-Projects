//
//  App_GroseryListApp.swift
//  App-GroseryList
//
//  Created by Manuel Salinas on 1/14/25.
//

import SwiftUI
import SwiftData

@main
struct App_GroseryListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}
