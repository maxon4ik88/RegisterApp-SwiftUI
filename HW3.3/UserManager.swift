//
//  UserManager.swift
//  HW3.3
//
//  Created by Maxon on 24.10.2020.
//
import Foundation
import Combine

class UserManager: ObservableObject {
    
    @Published var validate = false
    @Published var isRegister = false
    
    let defaults = UserDefaults.standard
    
    var name: String = ""
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
}
