//
//  ListRowView.swift
//  TodoListSwiftUI
//
//  Created by saul on 6/5/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel

    var body: some View {
        Label(
            item.title,
            systemImage: item.isCompleted ? "checkmark.circle" : "circle"
        )
    }
}

#Preview {
    let item1 = ItemModel(title: "Todo 1", isCompleted: true)
    let item2 = ItemModel(title: "Todo 2", isCompleted: false)

    return Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
