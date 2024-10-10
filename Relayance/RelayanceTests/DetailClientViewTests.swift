//
//  DetailClientViewTests.swift
//  RelayanceTests
//

import XCTest
@testable import Relayance

final class DetailClientViewTests: XCTestCase {
    
    func testDetailClientView() {
        // Given
        let client = Client(nom: "Charlie Durand", email: "charlie.durand@example.com", dateCreationString: "2023-09-12")
        
        // When
        let detailClientView = DetailClientView(client: client)
        
        // Then
        XCTAssertNotNil(detailClientView.body, "La vue de détail du client ne devrait pas être nulle.")
    }
    
    func testDeleteClientButtonExists() {
        // Given
        let client = Client(nom: "Charlie Durand", email: "charlie.durand@example.com", dateCreationString: "2023-09-12")
        
        // When
        let detailClientView = DetailClientView(client: client)
        
        // Then
        // Verification for delete button existence
        XCTAssertNotNil(detailClientView.body, "Le bouton de suppression devrait être présent dans la vue de détail du client.")
    }
}
