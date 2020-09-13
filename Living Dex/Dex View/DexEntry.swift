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
