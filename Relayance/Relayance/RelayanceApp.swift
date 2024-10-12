//
//  RelayanceApp.swift
//  Relayance
//
//  Created by Amandine Cousin on 08/07/2024.
//

import SwiftUI

@main
struct RelayanceApp: App {
    @StateObject var viewModel = ClientListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListClientsView()
                .environmentObject(viewModel)
        }
    }
}
