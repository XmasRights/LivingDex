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
    let caughtAction: () -> Void
    let inspectAction: (() -> Void)

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("BackgroundColor"))
                .shadow(color: Color("Shadow1"), radius: 10, x: 10, y: 10)
                .shadow(color: Color("Shadow2"), radius: 10, x: -5, y: -5)

            contents
                .onTapGesture(perform: caughtAction)
                .onLongPressGesture(perform: inspectAction)
        }
    }
}

extension DexCell {
    init(pokemon: Pokémon, caught: Bool) {
        self.init(
            pokemon: pokemon,
            caught: caught,
            caughtAction: {},
            inspectAction: {}
        )
    }
}

// MARK: - Custom Views

private extension DexCell {
    var contents: some View {
        ZStack {
            header

            VStack {
                Image(pokemon: pokemon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Text(pokemon.name)
                    .font(.body)
                    .lineLimit(1)
            }
        }
        .padding()
    }

    var header: some View {
        VStack {
            HStack {
                Text("\(pokemon.nationalDexNumber)")
                    .font(.subheadline)

                Spacer()

                checkmark
                    .font(.subheadline)
                    .contentShape(Rectangle())
            }
            Spacer()
        }
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

// MARK: - SwiftUI Preview

struct DexCell_Previews: PreviewProvider {
    private static var demoPokemon: [Pokémon] {
        DemoPokémonProvider().all
    }

    static var previews: some View {
        Group {
            DexCell(pokemon: demoPokemon.first!, caught: false)
                .previewLayout(.fixed(width: 200, height: 200))
                .preferredColorScheme(.light)
                .padding()
                .previewDisplayName("Dex Cell (Light)")

            DexCell(pokemon: demoPokemon.first!, caught: true)
                .previewLayout(.fixed(width: 200, height: 200))
                .preferredColorScheme(.light)
                .padding()
                .previewDisplayName("Dex Cell (Light, Caught)")

            DexCell(pokemon: demoPokemon.first!, caught: false)
                .previewLayout(.fixed(width: 200, height: 200))
                .preferredColorScheme(.dark)
                .padding()
                .previewDisplayName("Dex Cell (Dark)")

            DexCell(pokemon: demoPokemon.first!, caught: true)
                .previewLayout(.fixed(width: 200, height: 200))
                .preferredColorScheme(.dark)
                .padding()
                .previewDisplayName("Dex Cell (Dark, Caught)")
        }
    }
}
