//
//  ModelDataTests.swift
//  RelayanceTests
//

import XCTest
@testable import Relayance

final class ModelDataTests: XCTestCase {
    
    func testModelDataChargementWithMock() {
        // Given
        let mockJson = "[{\"nom\": \"Alice Martin\", \"email\": \"alice.martin@example.com\", \"date_creation\": \"2023-09-10\"}]"
        let mockData = mockJson.data(using: .utf8)!
        
        // When
        let decoder = JSONDecoder()
        let clients: [Client]
        do {
            clients = try decoder.decode([Client].self, from: mockData)
        } catch {
            XCTFail("Le décodage du JSON de test a échoué : \(error.localizedDescription)")
            return
        }
        
        // Then
        XCTAssertEqual(clients.count, 1, "Le nombre de clients décodés devrait être égal à 1.")
        XCTAssertEqual(clients.first?.nom, "Alice Martin", "Le nom du client devrait être 'Alice Martin'.")
    }
    
    func testModelDataChargementInvalidJson() {
        // Given
        let invalidJson = "[{\"nom\": \"Alice Martin\", \"email\": \"" // JSON malformé
        let mockData = invalidJson.data(using: .utf8)!
        
        // When
        let decoder = JSONDecoder()
        
        // Then
        XCTAssertThrowsError(try decoder.decode([Client].self, from: mockData), "Le décodage du JSON malformé devrait échouer.")
    }
    
    func testModelDataChargementImplicitClosure() {
        // Given
        let mockJson = "[{\"nom\": \"Alice Martin\", \"email\": \"alice.martin@example.com\", \"date_creation\": \"2023-09-10\"}]"
        let mockData = mockJson.data(using: .utf8)!
        
        // When
        let decoder = JSONDecoder()
        let clients = (try? decoder.decode([Client].self, from: mockData)) ?? []
        
        // Then
        XCTAssertEqual(clients.count, 1, "Le nombre de clients décodés devrait être égal à 1.")
        XCTAssertEqual(clients.first?.nom, "Alice Martin", "Le nom du client devrait être 'Alice Martin'.")
    }
    
    func testModelDataChargementInvalidJsonImplicitClosure() {
        // Given
        let invalidJson = "[{\"nom\": \"Alice Martin\", \"email\": \"" // JSON malformé
        let mockData = invalidJson.data(using: .utf8)!
        
        // When
        let decoder = JSONDecoder()
        let clients = (try? decoder.decode([Client].self, from: mockData)) ?? []
        
        // Then
        XCTAssertTrue(clients.isEmpty, "Le nombre de clients devrait être égal à 0 en cas d'erreur de décodage.")
    }
}
