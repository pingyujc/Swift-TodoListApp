//
//  LogInView.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewmodel = LogInViewViewModel()
    var body: some View {
        NavigationView{
            VStack {
                // header
                HeaderView(title: "ToDo List", subtitle: "Time to get things done!", angle: 15, bgcolor: .blue)
                
                Form{
                    
                    if !viewmodel.errorMessage.isEmpty{
                        Text(viewmodel.errorMessage)
                            .foregroundColor(.red)
                    }
                    // log in field
                    TextField("Email", text: $viewmodel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)

                        .padding()
                    
                    SecureField("Password", text: $viewmodel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    TLButton(title: "Log in", bgcolor: .blue){
                        // try logging in
                        viewmodel.login()
                    }
                    .padding()
                }
                
                // create accoutn, navigate to registration page
                VStack{
                    Text("First time here?")
                    NavigationLink("Create new account") {
                        RegisterView()
                    }
                }
                .padding(.bottom, 50)
        
                
                Spacer()
            }
        }
    }
}

#Preview {
    LogInView()
}
