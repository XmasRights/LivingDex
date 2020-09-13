//
//  CaughtPokemon.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 13/09/2020.
//

import SwiftUI

class CaughtPokemon: ObservableObject {
    @Published private(set) var caught: Set<Int> {
        didSet {
            Self.save(data: caught)
        }
    }

    private static let key = "caught_pokemon"
    private static var defaults: UserDefaults {
        UserDefaults.standard
    }

    init() {
        self.caught = Self.load() ?? Set<Int>()
    }

    private static func save(data: Set<Int>) {
        let list = Array(data)
        defaults.setValue(list, forKey: key)
    }

    private static func load() -> Set<Int>? {
        guard let list = defaults.object(forKey: key) as? Array<Int> else {
            return nil
        }
        return Set<Int>(list)
    }
}

extension CaughtPokemon {
    func contains(_ pokemon: Pokémon) -> Bool {
        self.caught.contains(pokemon.nationalDexNumber)
    }

    func toggle(_ pokemon: Pokémon) {
        if self.contains(pokemon) {
            self.caught.remove(pokemon.nationalDexNumber)
        } else {
            self.caught.insert(pokemon.nationalDexNumber)
        }
    }
}
