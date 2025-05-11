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
    @Published var isVisibleList: Bool = false
    @Published var users: [User] = []
    @Published var errorMesage: String = String()
    @Published var showAlert: Bool = false
    
    init() { }
    
    func inserUser() -> Bool {
        guard let ageNew = Int(age) else {
            errorMesage = "Dados inválidos!"
            return false
        }
        users.append(User(name: name, age: ageNew))
        clearFunc()
        isVisibleList = true
        return isVisibleList
    }
    
    func deleteUser(userExcluir: User) {
        for (index, user) in users.enumerated() {
            if user.id == userExcluir.id {
                users.remove(at: index)
                break
            }
        }
        errorMesage = "\(userExcluir.name) excluido com sucesso!"
        if users.isEmpty {
            isVisibleList = false
        }
    }
    
    private func clearFunc() {
        name = String()
        age = String()
    }
    
}
