//
//  Living_DexApp.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

@main
struct Living_DexApp: App {
    let pokemonProvider = FanzeyiProvider()

    var body: some Scene {
        WindowGroup {
            DexView(allPokemon: pokemonProvider.all)
        }
    }
}
