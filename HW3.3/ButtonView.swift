//
//  ButtonView.swift
//  HW3.3
//
//  Created by Maxon on 23.10.2020.
//

import SwiftUI

struct ButtonView: View {
    var name: String
    var color: Color
    var checkMark: Color?
    var state: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                if checkMark != nil {
                    Image(systemName: "checkmark.circle")
                        .font(.largeTitle)
                        .foregroundColor(state ? checkMark : .secondary)
                }
                Text(name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(state ? .white : .secondary)
            }
        }
        .frame(width: 200, height: 60)
        .background(state ? color : .gray)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 4))
        .disabled(!state)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(name: "Button", color: .red, checkMark: .yellow, state: false, action: {print("hello")})
    }
}
