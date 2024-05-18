//
//  NewItemView.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 75)
            
            Form{
                // Title
                TextField("Title", text: $viewModel.title)
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: "Save", bgcolor: .pink){
                    
                    // check if saveable
                    if viewModel.canSave{
                        viewModel.save()
                        // once save, we close the sheet
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }

                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select a valid date")
                )
                
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: { _ in
        
    }))
}
