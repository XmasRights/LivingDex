//
//  DexView.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 12/09/2020.
//

import SwiftUI

struct DexView: View {
    let provider: DexViewProvider

    var body: some View {
        List {
            ForEach(provider.allEntries) { entry in
                DexCell(entry: entry)
            }
        }
    }
}

struct DexCell: View {
    @ObservedObject var entry: DexEntry

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

            Spacer()

            checkmark
                .font(.largeTitle)
        }
        .padding()
        .onTapGesture(perform: toggleCaught)
    }

    var checkmark: some View {
        switch entry.caught {
        case true:
            return Image(systemName: "checkmark.circle")
                .foregroundColor(.green)

        case false:
            return Image(systemName: "circle")
                .foregroundColor(.gray)
        }
    }

    func toggleCaught() {
        self.entry.caught.toggle()
    }
}

struct DexView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
    }
}
