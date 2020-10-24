//
//  RegisteredView.swift
//  HW3.3
//
//  Created by Maxon on 24.10.2020.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    @State private var letterCount = 0
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("EnterYourName", text: Binding(
                            get: { self.name },
                            set: { (newValue) in
                                if newValue.count < 3 {
                                    userManager.validate = false
                                } else {
                                    userManager.validate = true
                                    self.name = newValue
                                }
                                letterCount = newValue.count
                            }))
                    .disableAutocorrection(true)
                    .frame(width: 300, height: 35)
                    .multilineTextAlignment(.center)
                    .border(Color.black, width: 4)
                    .padding()
                Text("\(letterCount)")
                    .font(.title)
                    .foregroundColor(.red)
            }
            
            ButtonView(name: "OK", color: .blue, checkMark: .red, state: userManager.validate, action: registerUser)
        }
    }
}

extension RegisteredView {
    private func registerUser() {
        if !name.isEmpty {
            
            userManager.isRegister = true
            userManager.defaults.set("\(name)", forKey: "User")
            userManager.defaults.set(true, forKey: "isRegister")
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
            .environmentObject(UserManager())
    }
}
