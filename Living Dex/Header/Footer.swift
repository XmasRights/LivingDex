//
//  Footer.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 07/11/2020.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        VStack {
            Divider()

            HStack {
                Menu {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                } label: {
                    Label("Filter", systemImage: "line.horizontal.3.decrease.circle.fill")
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Footer()
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)

            Footer()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }

}
