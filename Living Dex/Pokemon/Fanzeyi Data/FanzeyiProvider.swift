//
//  FanzeyiProvider.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 19/09/2020.
//

import SwiftUI

class FanzeyiProvider: PokémonProvider {
    lazy var all: [Pokémon] = {
        readJson().map(convert)
    }()

    private func readJson() -> [FanzeyiPokemon] {
        guard let asset = NSDataAsset(name: "pokedex") else {
            preconditionFailure()
        }

        do {
            return try JSONDecoder().decode([FanzeyiPokemon].self, from: asset.data)
        } catch {
            preconditionFailure(error.localizedDescription)
        }
    }

    private func convert(_ pokemon: FanzeyiPokemon) -> Pokémon {
        .init(nationalDexNumber: pokemon.id,
              name: pokemon.name["english"]!)
    }
}

private struct FanzeyiPokemon: Codable {
    let id: Int
    let name: [String: String]
    let type: [String]
}
