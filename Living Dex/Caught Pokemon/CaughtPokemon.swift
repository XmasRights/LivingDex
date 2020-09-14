//
//  CaughtPokemon.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 13/09/2020.
//

import SwiftUI

class CaughtPokemon: ObservableObject {
    @Published private(set) var caught: Set<Int>! {
        didSet {
            self.save(data: caught)
        }
    }

    private let key = "caught_pokemon"
    private var defaults: UserDefaults {
        UserDefaults.standard
    }

    init() {
        self.caught = self.load() ?? Set<Int>()
    }

    private func save(data: Set<Int>) {
        let list = Array(data)
        defaults.setValue(list, forKey: key)
    }

    private func load() -> Set<Int>? {
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
