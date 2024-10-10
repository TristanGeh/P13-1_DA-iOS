//
//  ListClientsViewTests.swift
//  RelayanceTests
//

import XCTest
@testable import Relayance

final class ListClientsViewTests: XCTestCase {
    
    func testListClientsView() {
        // Given
        let clients = [
            Client(nom: "Alice Martin", email: "alice.martin@example.com", dateCreationString: "2023-09-10"),
            Client(nom: "Bob Dupuis", email: "bob.dupuis@example.com", dateCreationString: "2023-09-11")
        ]
        
        // When
        let listClientsView = ListClientsView(clientsList: clients)
        
        // Then
        XCTAssertNotNil(listClientsView.body, "La vue de la liste des clients ne devrait pas être nulle.")
    }
    
    func testAddClientButtonShowsModal() {
        // Given
        let view = ListClientsView(clientsList: [])
        
        // When
        let addClientButton = view.body
        
        // Then
        XCTAssertNotNil(addClientButton, "Le bouton d'ajout de client devrait être présent dans la vue.")
    }
}
