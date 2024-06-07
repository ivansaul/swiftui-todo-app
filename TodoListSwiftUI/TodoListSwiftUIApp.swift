//
//  TodoListSwiftUIApp.swift
//  TodoListSwiftUI
//
//  Created by saul on 6/5/24.
//

import SwiftUI

@main
struct TodoListSwiftUIApp: App {
    @StateObject var listViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
