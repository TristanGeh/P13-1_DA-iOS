//
//  RelayanceTests.swift
//  RelayanceTests
//
//  Created by Amandine Cousin on 08/07/2024.
//

import XCTest
@testable import Relayance

final class ClientTests: XCTestCase {
    
    func testCreerNouveauClient() {
        // Given
        let nom = "Jean Dupont"
        let email = "jean.dupont@example.com"

        // When
        let client = Client.creerNouveauClient(nom: nom, email: email)

        // Then
        XCTAssertEqual(client.nom, nom)
        XCTAssertEqual(client.email, email)
        XCTAssertTrue(client.estNouveauClient())
    }

    func testEstNouveauClient() {
        // Given
        let nom = "Marie Martin"
        let email = "marie.martin@example.com"

        // When
        let client = Client.creerNouveauClient(nom: nom, email: email)

        // Then
        XCTAssertTrue(client.estNouveauClient(), "Le client devrait être considéré comme nouveau le jour de sa création.")

        // Given an old date
        let oldDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let oldDateString = ISO8601DateFormatter().string(from: oldDate)
        let oldClient = Client(nom: "Ancien Client", email: "ancien.client@example.com", dateCreationString: oldDateString)

        // Then
        XCTAssertFalse(oldClient.estNouveauClient(), "Le client créé la veille ne devrait pas être considéré comme nouveau.")
    }

    func testClientExiste() {
        // Given
        let client1 = Client(nom: "Paul Durand", email: "paul.durand@example.com", dateCreationString: "2023-09-10")
        let client2 = Client(nom: "Laura Dupuis", email: "laura.dupuis@example.com", dateCreationString: "2023-09-11")
        let clientsList = [client1, client2]

        // When
        let newClient = Client(nom: "Paul Durand", email: "paul.durand@example.com", dateCreationString: "2023-09-10")

        // Then
        XCTAssertTrue(newClient.clientExiste(clientsList: clientsList), "Le client devrait exister dans la liste.")

        // When
        let nonExistantClient = Client(nom: "Inconnu", email: "inconnu@example.com", dateCreationString: "2023-09-12")

        // Then
        XCTAssertFalse(nonExistantClient.clientExiste(clientsList: clientsList), "Le client ne devrait pas exister dans la liste.")
    }
    
}
