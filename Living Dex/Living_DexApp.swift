//
//  Living_DexApp.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

@main
struct Living_DexApp: App {
    let pokemonProvider = DemoPokémonProvider()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                DexView(allPokemon: pokemonProvider.all)
                    .navigationTitle("Living Dex")
            }
        }
    }
}
