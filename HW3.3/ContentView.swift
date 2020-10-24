//
//  ContentView.swift
//  HW3.3
//
//  Created by Maxon on 23.10.2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.defaults.string(forKey: "User") ?? "noUser")")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Spacer()
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Spacer()
            ButtonView(name: timer.buttonTitle, color: .red, state: true, action: timer.startTimer)
            Spacer()
            ButtonView(name: "Exit", color: .green, state: true, action: exitButton)
                .padding()
        }
    }
}

extension ContentView {
    private func exitButton() {
        userManager.isRegister = false
        userManager.defaults.removeObject(forKey: "isRegister")
        userManager.defaults.removeObject(forKey: "User")

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
