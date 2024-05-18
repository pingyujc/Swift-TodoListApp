//
//  LogInViewViewModel.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import Foundation
import FirebaseAuth

class LogInViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    // to log in
    func login() {
        guard validate() else {
            return
        }
        print("try login")
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    // check if valid
    func validate ()->Bool {
        errorMessage = ""

        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            // empty email or password, shoudl give them error
            errorMessage = "Email or password is empty, try again."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Email not valid."
            return false
        }
        
        return true
    }
}
