//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init (){}
    
    func register() {
        guard validate() else {
            return
        }
        // now register the user
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    // insert the user record into firebase
    private func insertUserRecord (id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        if let dict = newUser.asDictionary() {
            db.collection("users")
                .document(id)
                .setData(dict)
        } else {
            print("Failed to convert user to dictionary")
        }
    }
    
    
    
    // validate the input information
    private func validate()->Bool {
        errorMessage = ""
        // check if anything is empty
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            // empty email or password, shoudl give them error
            errorMessage = "Email or password is empty, try again."
            return false
        }
        // check valid email
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Email not valid."
            return false
        }
        
        // password lentgh
        guard password.count >= 6 else {
            errorMessage = "Password should have at least 6 characters"
            return false
        }
        
        return true
    }
}
