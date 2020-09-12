//
//  Living_DexApp.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

@main
struct Living_DexApp: App {
    var pokemonProvider: some PokémonProvider {
        DemoPokémonProvider()
    }

    var dexEntries: [DexEntry] {
        self.pokemonProvider.all.map {
            DexEntry(pokemon: $0, caught: false)
        }
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                DexView(entries: dexEntries)
                    .navigationTitle("Living Dex")
            }
        }
    }
}
