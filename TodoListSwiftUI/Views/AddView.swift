//
//  AddView.swift
//  TodoListSwiftUI
//
//  Created by saul on 6/5/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel

    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)

                Button(
                    action: saveButtonPressed,
                    label: {
                        Text("Save".uppercased())
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                )
            }
            .padding(.horizontal)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: buildAlert)
    }

    func saveButtonPressed() {
        if isValidTodoText() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }

    func isValidTodoText() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!! 🫠"
            showAlert.toggle()
            return false
        }
        return true
    }

    func buildAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
