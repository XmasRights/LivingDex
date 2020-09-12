//
//  DexEntry.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import Foundation

struct DexEntry: Identifiable {
    let pokemon: Pokémon
    let caught: Bool

    var id: Int {
        // TODO include variant forms
        pokemon.nationalDexNumber
    }
}
