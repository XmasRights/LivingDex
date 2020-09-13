//
//  DexEntry.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

class DexEntry: ObservableObject, Identifiable {
    let pokemon: Pokémon
    let image: Image

    var id: Int {
        pokemon.nationalDexNumber
    }

    init(pokemon: Pokémon, image: Image) {
        self.pokemon = pokemon
        self.image = image
    }
}

class DexViewProvider: ObservableObject {
    @Published var allEntries: [DexEntry]

    init(pokemon: PokémonProvider, thumbnailProvider: ThumbnailProvider) {
        self.allEntries = pokemon.all.map {
            let image = thumbnailProvider.thumbnail(for: $0)
            return DexEntry(
                pokemon: $0,
                image: image
            )
        }
    }
}
