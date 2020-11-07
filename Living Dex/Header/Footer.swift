//
//  Footer.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 07/11/2020.
//

import SwiftUI

struct Footer: View {
    @Binding var caughtFilter: CaughtFilter

    var body: some View {
        VStack {
            Divider()

            HStack {
                Menu {
                    Picker("Caught Filter", selection: $caughtFilter) {
                        Text("Caught Only").tag(CaughtFilter.caught)
                        Text("Uncaught Only").tag(CaughtFilter.uncaught)
                        Text("All").tag(CaughtFilter.all)
                    }
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
    @State static var caughtFilter = CaughtFilter.all

    static var previews: some View {
        Group {
            Footer(caughtFilter: $caughtFilter)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)

            Footer(caughtFilter: $caughtFilter)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }

}
