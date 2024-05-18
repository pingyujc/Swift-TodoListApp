//
//  RegisterView.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewmodel = RegisterViewViewModel()
    
    var body: some View {
        HeaderView(title: "Register", subtitle: "Let's make your account!", angle: -15, bgcolor: .purple)
            .padding(.top, -40)
        
        
        // form for signing up
        Form{
            TextField("Name", text: $viewmodel.name)
            TextField("Email Address", text: $viewmodel.email)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            SecureField("Password", text: $viewmodel.password)
            // get the button
            TLButton(title: "Create Account", bgcolor: .pink){
                //action goes here
                viewmodel.register()
            }
            .padding()
        }
        .offset(CGSize(width: 10.0, height: 80.0))
        
        Spacer()
        
    }
}

#Preview {
    RegisterView()
}
