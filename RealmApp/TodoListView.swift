//
//  ContentView.swift
//  RealmApp
//
//  Created by Simran Preet Singh Narang on 2022-04-27.
//

import SwiftUI
import RealmSwift

struct TodoListView: View {
    
    @ObservedResults(Todo.self) var todos
    @State private var name: String = ""
    @FocusState private var focus: Bool?
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Todo", text: $name)
                        .focused($focus, equals: true)
                        .textFieldStyle(.roundedBorder)
                    Spacer()
                    Button {
                        let newTodo = Todo(name: name)
                        $todos.append(newTodo)
                        name = ""
                        focus = nil
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .disabled(name.isEmpty)
                    }

                }
                .padding()
                
                List() {
                    ForEach(todos) { todo in
                        Text(todo.name)
                    }.listRowSeparator(.hidden)
                }.listStyle(.plain)
            }.navigationTitle("Realm Todos")
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
