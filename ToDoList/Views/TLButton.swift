//
//  TLButton.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/14/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let bgcolor: Color
    let action: ()->Void
    var body: some View {

        Button(action: {
            action()
        }) {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgcolor)
                Text(title)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    TLButton(title: "Title", bgcolor: .pink){
        // action will go here
    }
}
