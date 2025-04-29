//
//  ViewModel.swift
//  app_cadastro
//
//  Created by Renan Toniolo Rocha on 28/04/25.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    @Published var name = String()
    @Published var age = String()
    @Published var users: [User] = []
    @Published var error: String = String()
    
    init() { }
    
    func inserUser(){
        guard let ageNew = Int(age) else {
            error = "Dados inválidos!"
            return
        }
        error = String()
        users.append(User(name: name, age: ageNew))
        clearFunc()
    }
    
    private func clearFunc() {
        name = String()
        age = String()
    }
    
}
