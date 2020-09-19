//
//  DexCell.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 19/09/2020.
//

import SwiftUI

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
                .font(.body)
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

struct DexCell_Previews: PreviewProvider {
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
        }
    }
}
