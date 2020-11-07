//
//  CaughtFilter.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 07/11/2020.
//

import Foundation

enum CaughtFilter: Int {
    case all      = 0
    case caught   = 1
    case uncaught = 2
}

extension CaughtFilter {
    func filter(caught: CaughtPokemon) -> (Pokémon) -> Bool {
        switch self {
        case .all:
            return { _ -> Bool in return true }

        case .caught:
            return { pokemon -> Bool in
                caught.contains(pokemon)
            }
        case .uncaught:
            return { pokemon -> Bool in
                !caught.contains(pokemon)
            }
        }
    }
}

class SelectedCaughtFilter: ObservableObject {
    @Published var current: CaughtFilter = .all
}
