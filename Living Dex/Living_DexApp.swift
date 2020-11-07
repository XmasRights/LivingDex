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
    @ObservedObject var caughtFilter = SelectedCaughtFilter()

    var caughtCount: Int {
        caughtPokemon.caught.count
    }

    var body: some Scene {
        WindowGroup {
            VStack(spacing: 12) {
                Header(title: title, caught: caughtCount)

                DexView(
                    allPokemon: pokemonProvider.all,
                    caughtPokemon: caughtPokemon,
                    caughtSelectionFilter: caughtFilter.current
                )

                Footer(caughtFilter: $caughtFilter.current)
            }
            .background(Color("BackgroundColor"))
        }
    }
}
