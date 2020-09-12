//
//  DemoThumbnailProvider.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

struct DemoThumbnailProvider: ThumbnailProvider {
    func thumbnail(for pokémon: Pokémon) -> Image {
        let name = String(format: "%03d", pokémon.nationalDexNumber)
        return Image(name)
    }
}
