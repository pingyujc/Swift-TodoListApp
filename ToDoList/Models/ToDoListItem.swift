//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{
    let id:String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ done: Bool) {
            self.isDone = done
    }
}
