//
//  User.swift
//  app_cadastro
//
//  Created by Renan Toniolo Rocha on 28/04/25.
//

import Foundation

final class User: Identifiable {
    let id: UUID = UUID()
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
