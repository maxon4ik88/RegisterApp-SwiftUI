//
//  HW3_3App.swift
//  HW3.3
//
//  Created by Maxon on 23.10.2020.
//

import SwiftUI

@main
struct HW3_3App: App {
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager())
        }
    }
}
