//
//  DemoPokemonProvider.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import Foundation

struct DemoPokémonProvider: PokémonProvider {
    let all: [Pokémon] = [
        .init(nationalDexNumber: 1, name: "Bulbasaur"),
        .init(nationalDexNumber: 2, name: "Ivysaur"),
        .init(nationalDexNumber: 3, name: "Venasaur"),
        .init(nationalDexNumber: 4, name: "Charmander"),
        .init(nationalDexNumber: 5, name: "Charmeleon"),
        .init(nationalDexNumber: 6, name: "Charizard"),
        .init(nationalDexNumber: 7, name: "Squirtle"),
        .init(nationalDexNumber: 8, name: "Wartortle"),
        .init(nationalDexNumber: 9, name: "Blastoise")
    ]
}
