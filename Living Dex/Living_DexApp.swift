//
//  Living_DexApp.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

@main
struct Living_DexApp: App {
    private let pokemonProvider = DemoPokémonProvider()
    private let thumbnailProvider = DemoThumbnailProvider()

    private var dexEntries: [DexEntry] {
        self.pokemonProvider.all.map {
            let image = thumbnailProvider.thumbnail(for: $0)
            return DexEntry(
                pokemon: $0,
                image: image,
                caught: false
            )
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                DexView(entries: dexEntries)
            }
            .navigationTitle("Living Dex")
        }
    }
}
