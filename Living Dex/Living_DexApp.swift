//
//  Living_DexApp.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

@main
struct Living_DexApp: App {
    private var dexProvider = DexViewProvider(
        pokemon: DemoPokémonProvider(),
        thumbnailProvider: DemoThumbnailProvider()
    )

    var body: some Scene {
        WindowGroup {
            NavigationView {
                DexView(provider: dexProvider)
            }
            .navigationTitle("Living Dex")
        }
    }
}
