//
//  DexView.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

struct DexView: View {
    let provider: DexViewProvider
    @ObservedObject var caughtPokemon = CaughtPokemon()

    var body: some View {
        List {
            ForEach(provider.allEntries) { entry in
                DexCell(entry: entry, caught: isCaught(entry))
                    .onTapGesture(perform: {
                        self.toggleCaught(entry)
                    })
            }
        }
    }

    private func toggleCaught(_ entry: DexEntry) {
        caughtPokemon.toggle(entry.pokemon)
    }

    private func isCaught(_ entry: DexEntry) -> Bool {
        caughtPokemon.contains(entry.pokemon)
    }
}

struct DexCell: View {
    let entry: DexEntry
    let caught: Bool

    var body: some View {
        HStack(spacing: 16) {
            entry.image
                .resizable()
                .frame(width: 60, height: 60)

            VStack(alignment: .leading) {
                Text("\(entry.pokemon.nationalDexNumber)")

                Text(entry.pokemon.name)
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
