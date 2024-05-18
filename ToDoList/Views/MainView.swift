//
//  ContentView.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        // check if current user is signed in
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in, should show the main page
            TabView{
                ToDoListView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            
        } else {
            LogInView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
