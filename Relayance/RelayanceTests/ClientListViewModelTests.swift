//
//  ClientListViewModelTests.swift
//  RelayanceTests
//

import XCTest
@testable import Relayance

final class ClientListViewModelTests: XCTestCase {

    var viewModel: ClientListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = ClientListViewModel()
        viewModel.clientsList.removeAll()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    
    func testAjoutClient() {
        
        viewModel.nom = "John Doe"
        viewModel.email = "john.doe@example.com"
        
        viewModel.ajouterClient()
        
        XCTAssertEqual(viewModel.clientsList.count, 1)
        XCTAssertEqual(viewModel.clientsList.first?.nom, "John Doe")
        XCTAssertEqual(viewModel.clientsList.first?.email, "john.doe@example.com")
    }
    
    func testAjoutClientAvecEmailImvalide() {
        
        viewModel.nom = "John Doe"
        viewModel.email = "invalid-email"
        
        viewModel.ajouterClient()
        
        XCTAssertEqual(viewModel.clientsList.count, 0)
    }
    
    func testSuppressionClient() {
        
        viewModel.nom = "Alice Smith"
        viewModel.email = "alice.smith@example.com"
        viewModel.ajouterClient()
        
        let client = viewModel.clientsList.first!
        
        viewModel.supprimerClient(client)
        
        XCTAssertEqual(viewModel.clientsList.count, 0)
    }
}
