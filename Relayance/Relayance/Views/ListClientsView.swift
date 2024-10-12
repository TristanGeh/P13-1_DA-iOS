//
//  ListClientsView.swift
//  Relayance
//
//  Created by Amandine Cousin on 10/07/2024.
//

import SwiftUI

struct ListClientsView: View {
    @State private var showModal: Bool = false
    @EnvironmentObject private var viewModel: ClientListViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.clientsList, id: \.self) { client in
                NavigationLink {
                    DetailClientView(client: client)
                } label: {
                    Text(client.nom)
                        .font(.title3)
                }
            }
            .navigationTitle("Liste des clients")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Ajouter un client") {
                        showModal.toggle()
                    }
                    .foregroundStyle(.orange)
                    .bold()
                }
            }
            .sheet(isPresented: $showModal, content: {
                AjoutClientView(dismissModal: $showModal)
            })
        }
    }

}

#Preview {
    ListClientsView()
        .environmentObject(ClientListViewModel())
}
