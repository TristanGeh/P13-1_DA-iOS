//
//  ClientListViewModel.swift
//  Relayance
//

import Foundation

final class ClientListViewModel: ObservableObject {
    @Published var clientsList: [Client] = ModelData.chargement("Source.json")
    @Published var nom: String = ""
    @Published var email: String = ""
    
    func ajouterClient() {
        guard !nom.isEmpty, !email.isEmpty else { return }
        let nouveauClient = Client(nom: nom, email: email, dateCreationString: DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short))
        clientsList.append(nouveauClient)
        nom = ""
        email = ""
        print(nouveauClient)
    }
    
    func supprimerClient(_ client: Client) {
        clientsList.removeAll { $0.nom == client.nom && $0.email == client.email }
    }
}

