//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject{
    // info to show on the profile page
    @Published var showingNewItemView = false
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var memberSince: Date = Date()
    
    
    
    
    init(){
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        fetchUserData(userId: uid)
        
    }
    
    func fetchUserData(userId: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(userId)
        
        docRef.getDocument { [weak self] (document, error) in
            guard let self = self else { return }
            // if we find the doc, we update values
            if let document = document, document.exists {
                if let joinedTimestamp = document.get("joined") as? Double {
                    self.memberSince = Date(timeIntervalSince1970: joinedTimestamp)
                }
                self.name = document.get("name") as? String ?? "No Name"
                self.email = document.get("email") as? String ?? "No Email"
            } else {
                print("Document does not exist or error: \(String(describing: error))")
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            // Handle successful sign out, e.g., navigate to login screen
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
    
}
