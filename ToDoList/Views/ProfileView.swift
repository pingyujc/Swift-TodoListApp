//
//  ProfileView.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Avatar
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
                
                // User Info: Name, email, Member since
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name: \(viewModel.name)")
                        .font(.headline)
                        .padding()
                    Text("Email: \(viewModel.email)")
                        .font(.subheadline)
                        .padding()
                    Text("Member since: \((viewModel.memberSince).formatted(date:.abbreviated, time:.shortened))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                Spacer()
                
                // Sign out button
                Button(action: {
                    viewModel.signOut()
                }) {
                    Text("Sign Out")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}


#Preview {
    ProfileView()
}
