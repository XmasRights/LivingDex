//
//  DexView.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

struct DexView: View {
    let entries: [DexEntry]

    var body: some View {
        List {
            ForEach(entries) { entry in
                DexCell(entry: entry)
            }
        }
    }
}

struct DexCell: View {
    let entry: DexEntry

    var body: some View {
        HStack(spacing: 16) {
            entry.image
                .resizable()
                .frame(width: 60, height: 60)

            VStack(alignment: .leading) {
                Text("\(entry.pokemon.nationalDexNumber)")

                Text(entry.pokemon.name)
                    .font(.title)
            }
        }
    }
}

struct DexView_Previews: PreviewProvider {
    static var entries: [DexEntry] {
        let pokemon = DemoPokémonProvider().all
        let thumbnailProvider = DemoThumbnailProvider()

        return pokemon.map {
            let image = thumbnailProvider.thumbnail(for: $0)
            return DexEntry(pokemon: $0, image: image, caught: false)
        }
    }

    static var previews: some View {
        NavigationView {
            DexView(entries: entries)
                .navigationTitle("Living Dex")
        }
    }
}
