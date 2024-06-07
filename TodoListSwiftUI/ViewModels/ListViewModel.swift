//
//  ListViewModel.swift
//  TodoListSwiftUI
//
//  Created by saul on 6/5/24.
//

import Foundation

//
// CRUD FUNCTIONS
//

final class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }

    let itemsKey: String = "items_list"

    init() {
        getItems()
    }

    func getItems() {
        // let newItems = [
        //    ItemModel(title: "Todo 1", isCompleted: false),
        //    ItemModel(title: "Todo 2", isCompleted: true),
        //    ItemModel(title: "Todo 3", isCompleted: true),
        // ]
        // items.append(contentsOf: newItems)

        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        items = savedItems
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = ItemModel(
            title: title,
            isCompleted: false
        )
        items.append(newItem)
    }

    func toggleItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0 == item }) {
            items[index] = item.toggleCompletion()
        }

        // items = items.map {
        //     if item != $0 {
        //         return $0
        //     }
        //     return $0.toggleCompletion()
        // }
    }

    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
