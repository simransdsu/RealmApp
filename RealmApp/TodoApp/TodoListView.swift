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
    @State private var searchFilter: String = ""
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
                    ForEach(todos.sorted(by: [
                        SortDescriptor(keyPath: "completed"),
                        SortDescriptor(keyPath: "urgency")
                    ])) { todo in
                        TodoListRow(todo: todo)
                    }
//                    .onDelete(perform: $todos.remove)
                    .listRowSeparator(.hidden)
                }.listStyle(.plain)
            }
            .animation(.default, value: todos)
            .searchable(text: $searchFilter,
                        collection: $todos,
                        keyPath: \.name,
                        prompt: "Search here") {
                ForEach(todos) { todo in
                    Text(todo.name)
                        .searchCompletion(todo.name)
                }
            }
            .navigationTitle("Realm Todos")
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
