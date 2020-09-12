//
//  ThumbnailProvider.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

protocol ThumbnailProvider {
    associatedtype Thumbnail: View
    func thumbnail(for pokémon: Pokémon) -> Thumbnail
}
