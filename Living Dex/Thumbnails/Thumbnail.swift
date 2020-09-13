//
//  Thumbnail.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 13/09/2020.
//

import SwiftUI

private extension Pokémon {
    var imageName: String {
        String(format: "%03d", self.nationalDexNumber)
    }
}

extension Image {
    init(pokemon: Pokémon) {
        self.init(pokemon.imageName)
    }
}
