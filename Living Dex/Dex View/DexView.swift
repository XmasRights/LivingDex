//
//  DexView.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

struct DexView: View {
    let allPokemon: [Pokémon]
    @ObservedObject var caughtPokemon = CaughtPokemon()

    var body: some View {
        List {
            ForEach(allPokemon) { pokemon in
                DexCell(pokemon: pokemon, caught: isCaught(pokemon))
                    .onTapGesture(perform: {
                        self.toggleCaught(pokemon)
                    })
            }
        }
    }

    private func toggleCaught(_ pokemon: Pokémon) {
        caughtPokemon.toggle(pokemon)
    }

    private func isCaught(_ pokemon: Pokémon) -> Bool {
        caughtPokemon.contains(pokemon)
    }
}

struct DexView_Previews: PreviewProvider {
    private static var demoPokemon: [Pokémon] {
        DemoPokémonProvider().all
    }

    static var previews: some View {
        DexView(allPokemon: demoPokemon)
    }
}
