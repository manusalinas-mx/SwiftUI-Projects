//
//  ContentView.swift
//  App-Wishlist
//
//  Created by Manuel Salinas on 1/13/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]

    @State private var showAlert: Bool = false
    @State private var title: String = ""

    var body: some View {
        NavigationStack {
            List(wishes) { wish in
                Text(wish.title)
                    .font(.title.weight(.light))
                    .padding(.vertical, 2)
                    .swipeActions(edge: .trailing) {
                        Button("Delete", systemImage: "xmark") {
                            modelContext.delete(wish)
                        }
                        .tint(.red)
                    }
            }
            .navigationTitle("Wishlist")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }

                if !wishes.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                    }
                }
            }
            .alert("New Wish", isPresented: $showAlert) {
                TextField("Enter a wish", text: $title)

                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }

            }
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView(
                        "My Wishlist",
                        systemImage: "heart",
                        description: Text("No wishes yet. Add one to get started."))
                    .tint(.red)
                }
            }
        }
    }
}

#Preview("Full List") {
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    container.mainContext.insert(Wish(title: "WC Paper"))
    container.mainContext.insert(Wish(title: "Dental Floss"))
    container.mainContext.insert(Wish(title: "Cereals"))
    container.mainContext.insert(Wish(title: "Cheese"))

    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
