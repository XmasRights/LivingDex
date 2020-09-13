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

struct DexCell: View {
    let pokemon: Pokémon
    let caught: Bool

    var body: some View {
        HStack(spacing: 16) {
            Image(pokemon: pokemon)
                .resizable()
                .frame(width: 60, height: 60)

            VStack(alignment: .leading) {
                Text("\(pokemon.nationalDexNumber)")

                Text(pokemon.name)
                    .font(.title)
            }

            Spacer()

            checkmark
                .font(.largeTitle)
        }
        .padding()
    }

    var checkmark: some View {
        switch caught {
        case true:
            return Image(systemName: "checkmark.circle")
                .foregroundColor(.green)

        case false:
            return Image(systemName: "circle")
                .foregroundColor(.gray)
        }
    }
}

struct DexView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
    }
}
