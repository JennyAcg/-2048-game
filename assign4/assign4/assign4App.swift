//
//  assign4App.swift
//  assign4
//
//  Created by Meisheng Liu on 11/5/21.
//

import SwiftUI

@main
struct assign4App: App {
    let persistenceController = PersistenceController.shared
    @StateObject var locManager = Locationer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(locManager)
        }
    }
}
