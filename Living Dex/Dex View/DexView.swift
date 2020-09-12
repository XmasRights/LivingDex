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
                Text("\(entry.pokemon.nationalDexNumber) - \(entry.pokemon.name)")
            }
        }
    }
}

struct DexView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DexView(entries: .demo)
                .navigationTitle("Living Dex")
        }
    }
}
