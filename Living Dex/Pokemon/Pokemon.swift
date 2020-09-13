//
//  Pokemon.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import Foundation

struct Pokémon: Identifiable {
    let nationalDexNumber: Int
    let name: String
    let variation: Variation? = nil

    var id: String {
        let prefix = "\(nationalDexNumber)"
        var suffix: String {
            guard let variation = self.variation else { return "" }
            return "+\(variation.rawValue)"
        }
        return prefix + suffix
    }
}

extension Pokémon {
    enum Variation: String {
        case alohan
        case galarian
    }
}
