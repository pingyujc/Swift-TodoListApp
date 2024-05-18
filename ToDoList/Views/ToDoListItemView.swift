//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/10/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading)
            {
                Text(item.title)
                    .font(.title)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .bold()
            }
            Spacer()
            
            Button(action: {
                // action
                viewModel.toggleIsDone(item:item)
                
                
            }) {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
//                    .font(.title) // Make the button image larger
                    .foregroundColor(item.isDone ? .blue : .black) // Optional color change
            }
            .buttonStyle(PlainButtonStyle()) // Ensures no additional button styling
            .padding() // Add some padding around the button
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "Drink Water", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
