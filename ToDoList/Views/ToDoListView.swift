//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        // using userid to get items
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationView{
            // display the todo list fetched
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button(role: .destructive) {
                                // action to delete
                                viewModel.delete(id: item.id, userId: userId)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red) // This makes the button red
                        }
                }
            }
            .navigationTitle("ToDo List")
            .toolbar{
                Button{
                    // action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
            
        }
    }
}

#Preview {
    ToDoListView(userId: "LahZcYMKp2NUDdIho8VgFWKpv6F3")
}
