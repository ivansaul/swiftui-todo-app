//
//  ItemModel.swift
//  TodoListSwiftUI
//
//  Created by saul on 6/5/24.
//

import Foundation

struct ItemModel: Identifiable, Equatable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    func toggleCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
