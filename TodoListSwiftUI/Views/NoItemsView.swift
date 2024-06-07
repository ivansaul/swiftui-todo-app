//
//  NoItemsView.swift
//  TodoListSwiftUI
//
//  Created by saul on 6/6/24.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items!")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("Are you productive person? I think you should click the add button and ad a bunch of items yo your todo list")
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)

                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something 🫠")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .background(animate ? Color.red : Color.accentColor)
                            .cornerRadius(15)
                            .shadow(
                                color: animate ? .black.opacity(0.7) : Color.accentColor.opacity(0.7),
                                radius: animate ? 20 : 5,
                                x: 5.0,
                                y: animate ? 28.0 : 10
                            )
                    }
                )
                .padding(.horizontal, animate ? 40 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -5 : 0)
            }
            .padding(40)
            .onAppear(perform: addAnimation)
        }
    }

    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
}
