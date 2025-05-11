//
//  ContentView.swift
//  app_cadastro
//
//  Created by Renan Toniolo Rocha on 28/04/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Cadastro")
                .font(.title)
                .bold()
            Image("imgPerfil")
                .resizable()
                .frame(width: 150, height: 150, alignment: .top)
                .aspectRatio(contentMode: .fit)
            TextField("Nome",
                      text: $viewModel.name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5)
            .padding(15)
            TextField("Idade",
                      text: $viewModel.age)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5)
            .padding(15)
            Button(action: {
                showAlert = !viewModel.inserUser()
            }) {
                Text("Adicionar")
                    .padding()
                    .foregroundColor(.blue)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 1))
            }
            if viewModel.isVisibleList {
                Text("Lista de Usuários")
                    .font(.title3)
                    .foregroundColor(.black)
                    .padding(10)
                List(viewModel.users) { item in
                    Text("\(item.name) - \(item.age)")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.deleteUser(userExcluir: item)
                                showAlert = true
                            } label: {
                                Label("Excluir", systemImage: "trash")
                            }
                        }
                }
                .background(Color.gray.opacity(0.1))
        }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .background(Color.gray.opacity(0.1))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Atenção"),
                  message: Text("\(viewModel.errorMesage)"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    ContentView()
}
