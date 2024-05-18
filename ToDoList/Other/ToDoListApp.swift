//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
