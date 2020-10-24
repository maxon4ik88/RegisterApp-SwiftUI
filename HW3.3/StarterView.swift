//
//  StarterView.swift
//  HW3.3
//
//  Created by Maxon on 24.10.2020.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.isRegister || userManager.defaults.bool(forKey: "isRegister") {
                ContentView()
            } else {
                RegisteredView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
