//
//  LoginHeaderView.swift
//  ToDoList
//
//  Created by Jonathan Chen on 5/14/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let bgcolor: Color
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(bgcolor)
                    .rotationEffect(Angle(degrees: angle))
                VStack{
                    Text(title)
                        .font(.system(size:50))
                        .foregroundColor(.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .padding(.top, 50)
            }
            .frame(width: UIScreen.main.bounds.width * 3, height: 300)
            .offset(CGSize(width: 0, height: -120)) // Corrected offset
        }
    }
}


#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, bgcolor: .pink)
}
