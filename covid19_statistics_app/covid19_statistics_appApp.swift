//
//  covid19_statistics_appApp.swift
//  covid19_statistics_app
//
//  Created by Junior Ferreira on 26/08/21.
//

import SwiftUI

@main
struct covid19_statistics_appApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
