//
//  DexView.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

struct DexView: View {
    let allPokemon: [Pokémon]
    var caughtPokemon: CaughtPokemon

    let columns: [GridItem] = [
        .init(.adaptive(minimum: 100))
    ]


    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(allPokemon) { pokemon in
                    DexCell(
                        pokemon: pokemon,
                        caught: isCaught(pokemon),
                        caughtAction: { self.toggleCaught(pokemon) },
                        inspectAction: { self.inspect(pokemon) }
                    )
                        .aspectRatio(1.0, contentMode: .fit)
                }
            }
            .padding()
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

    private func inspect(_ pokemon: Pokémon) {
        UIApplication.shared.open(
            pokemon.url,
            options: [:],
            completionHandler: nil
        )
    }
}

private extension Pokémon {
    var url: URL {
        let string = "https://pokemondb.net/pokedex/\(self.name.lowercased())#dex-locations"
        return URL(string: string)!
    }
}

struct DexView_Previews: PreviewProvider {
    private static var demoPokemon: [Pokémon] {
        DemoPokémonProvider().all
    }

    static var previews: some View {
        DexView(allPokemon: demoPokemon, caughtPokemon: CaughtPokemon())
    }
}
