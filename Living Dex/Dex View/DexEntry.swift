//
//  DexEntry.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

struct DexEntry: Identifiable {
    let pokemon: Pokémon
    let image: Image
    let caught: Bool

    var id: Int {
        // TODO include variant forms
        pokemon.nationalDexNumber
    }
}
