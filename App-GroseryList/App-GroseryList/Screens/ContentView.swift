//
//  ContentView.swift
//  App-GroseryList
//
//  Created by Manuel Salinas on 1/14/25.
//

import SwiftUI
import SwiftData
import TipKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @State private var item: String = ""
    @FocusState private var isFocused: Bool

    // Tip
    let buttonTip = ButtonTip()

    init() {
       // try? Tips.configure()
        setupTips()
    }

    private func setupTips() {
        do {
            try Tips.resetDatastore()
            Tips.showAllTipsForTesting() // just for testing
            try Tips.configure([.displayFrequency(.immediate)])
        } catch  {
            print("Error tip: \(error.localizedDescription)")
        }
    }

    private func addEssentialFoods() {
        modelContext.insert(Item(title: "Vegetables", isCompleted: false))
        modelContext.insert(Item(title: "Eggs", isCompleted: true))
    }

    var body: some View {
        NavigationStack {
            List(items) { item in
                Text(item.title)
                    .font(.title.weight(.light))
                    .padding(.vertical, 2)
                    .foregroundStyle(item.isCompleted ? .blue : .primary)
                    .strikethrough(item.isCompleted, color: .blue)
                    .italic(item.isCompleted)
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                modelContext.delete(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button("Done", systemImage: item.isCompleted ? "x.circle" : "checkmark.circle") {
                            item.isCompleted.toggle()
                        }
                        .tint(item.isCompleted ? .accentColor : .green)
                    }

            }
            .navigationTitle("Grosery List")
            .toolbar {
                if items.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addEssentialFoods()
                        } label: {
                            Image(systemName: "carrot")
                        }
                        .popoverTip(buttonTip)
                    }
                }
            }
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView("Empty Cart", systemImage: "cart.circle", description: Text("Add some items to the shipping list."))
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {
                    TextField(". . . ", text: $item)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(.tertiary)
                        .cornerRadius(12)
                        .font(.title.weight(.light))
                        .focused($isFocused)

                    Button {
                        guard !item.isEmpty else { return }

                        let newItem = Item(title: item, isCompleted: false)
                        modelContext.insert(newItem)

                        item = ""
                        isFocused = false
                    } label: {
                        Text("Save")
                            .font(.title2.weight(.medium))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.extraLarge)
                }
                .padding()
                .background(.bar)
            }
        }
    }
}


#Preview("Full List") {
    let container = try! ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    container.mainContext.insert(Item(title: "Vegetables", isCompleted: false))
    container.mainContext.insert(Item(title: "Eggs", isCompleted: true))

    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
