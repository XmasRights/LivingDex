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

    init() {
        self.caught = self.load() ?? .init()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didUpdateOniCloud(notification:)),
            name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
            object: NSUbiquitousKeyValueStore.default
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func didUpdateOniCloud(notification: Notification) {
        print("Holy flying rabbits, Batman")
        self.caught = load() ?? .init()
    }

    private func save(data: Set<Int>) {
        let list = Array(data)

        NSUbiquitousKeyValueStore.default.set(list, forKey: key)
        NSUbiquitousKeyValueStore.default.synchronize()
    }

    private func load() -> Set<Int>? {
        guard let list = NSUbiquitousKeyValueStore.default.array(forKey: key) as? Array<Int> else {
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
