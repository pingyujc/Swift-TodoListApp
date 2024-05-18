//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

// the whole list (multiple)
class ToDoListViewViewModel: ObservableObject{
    
    @Published var showingNewItemView = false
    init(){
        
    }
    
    // pass in the id, and delete the item from the firebase
    func delete(id: String, userId: String){
        let db = Firestore.firestore()
        
        db.collection("users/\(userId)/todos").document(id).delete()
    }
    
    func toggleIsDone(item: ToDoListItem){
        var tempItem = item
        tempItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // update the database
        let db = Firestore.firestore()
        
        if let dict = tempItem.asDictionary() {
            db.collection("users")
                .document(uid)
                .collection("todos")
                .document(tempItem.id)
                .setData(dict)
        } else {
            print("Failed to convert user to dictionary")
        }
    }
}
