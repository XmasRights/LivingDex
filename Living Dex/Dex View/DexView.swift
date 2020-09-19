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

    let columns: [GridItem] = [
        .init(.adaptive(minimum: 100))
    ]


    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(allPokemon) { pokemon in
                    DexCell(pokemon: pokemon, caught: isCaught(pokemon))
                        .aspectRatio(1.0, contentMode: .fit)
                }
            }
        }
        .background(
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
        )
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
