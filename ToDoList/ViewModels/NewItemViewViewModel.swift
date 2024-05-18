//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){
        
    }
    
    func save(){
        // check if saveable
        guard canSave else {
            return
        }
        
        //get current user ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // create model
        // generate random ID
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        // insert into database
        let db = Firestore.firestore()
        
        if let dict = newItem.asDictionary() {
            db.collection("users")
                .document(uId)
                .collection("todos")
                .document(newId)
                .setData(dict)
        } else {
            print("Failed to convert new Item to dictionary")
        }
        
    }
    
    // will check if saveing a valid info
    var canSave:Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
