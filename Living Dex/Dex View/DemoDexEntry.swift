//
//  DemoDexEntry.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import Foundation

extension Array where Element == DexEntry {
    static var demo: [DexEntry] {
        DemoPokémonProvider().all.map {
            DexEntry(pokemon: $0, caught: false)
        }
    }
}
