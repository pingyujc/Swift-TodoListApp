//
//  User.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import Foundation


// creating user that we will store in firebase
struct User : Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
