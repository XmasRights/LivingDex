//
//  Living_DexApp.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

@main
struct Living_DexApp: App {
    let title = "Living Dex"
    let pokemonProvider = FanzeyiProvider()
    @ObservedObject var caughtPokemon = CaughtPokemon()
    
    var caughtCount: Int {
        caughtPokemon.caught.count
    }

    var body: some Scene {
        WindowGroup {
            VStack(spacing: 12) {
                Header(title: title, caught: caughtCount)

                DexView(
                    allPokemon: pokemonProvider.all,
                    caughtPokemon: caughtPokemon
                )
            }
            .background(Color("BackgroundColor"))
        }
    }
}
