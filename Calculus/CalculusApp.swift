//
//  CalculusApp.swift
//  Calculus
//
//  Created by Thao Vo on 13/10/2023.
//

import SwiftUI

@main
struct CalculusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: CalculusViewModel())
                
        }
    }
}
