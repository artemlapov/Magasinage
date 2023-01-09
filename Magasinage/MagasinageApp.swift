//
//  MagasinageApp.swift
//  Magasinage
//
//  Created by Artem Lapov on 07.01.2023.
//

import SwiftUI

@main
struct MagasinageApp: App {
    @StateObject private var data = DataStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
    }
}
