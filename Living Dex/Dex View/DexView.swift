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
        VStack {
            HStack {
                Text("\(pokemon.nationalDexNumber)")
                    .font(.subheadline)

                Spacer()

                checkmark
                    .font(.subheadline)
            }

            Image(pokemon: pokemon)
                .resizable()
                .aspectRatio(contentMode: .fit)

            Text(pokemon.name)
                .font(.title)
        }
        .padding()
        .background(background)
    }

    var background: Color? {
        guard caught else {
            return nil
        }
        return Color.green
    }

    var checkmark: Image? {
        guard caught else {
            return nil
        }
        return Image(systemName: "checkmark.seal.fill")
    }
}

struct DexView_Previews: PreviewProvider {
    private static var demoPokemon: [Pokémon] {
        DemoPokémonProvider().all
    }

    static var previews: some View {
        Group {
            DexCell(pokemon: demoPokemon.first!, caught: false)
                .previewLayout(.fixed(width: 200, height: 200))
                .preferredColorScheme(.light)
                .previewDisplayName("Dex Cell (Light)")

            DexCell(pokemon: demoPokemon.first!, caught: true)
                .previewLayout(.fixed(width: 200, height: 200))
                .preferredColorScheme(.light)
                .previewDisplayName("Dex Cell (Light, Caught)")

            DexCell(pokemon: demoPokemon.first!, caught: false)
                .previewLayout(.fixed(width: 200, height: 200))
                .preferredColorScheme(.dark)
                .previewDisplayName("Dex Cell (Dark)")

            DexCell(pokemon: demoPokemon.first!, caught: true)
                .previewLayout(.fixed(width: 200, height: 200))
                .preferredColorScheme(.dark)
                .previewDisplayName("Dex Cell (Dark, Caught)")

            DexView(allPokemon: demoPokemon)
        }
    }
}
