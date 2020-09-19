//
//  Header.swift
//  Living Dex
//
//  Created by Christopher Fonseka on 19/09/2020.
//

import SwiftUI

struct Header: View {
    let title: String
    let caught: Int

    var body: some View {
        VStack {
            ZStack {
                titleBar
                caughtLabel
            }
            .padding()

            Divider()
        }
        .background(
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
        )
    }

    private var titleBar: some View {
        HStack {
            Spacer()
            Text(title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }

    private var caughtLabel: some View {
        HStack {
            Spacer()

            Text("Caught: \(caught)")
                .padding(.horizontal)
                .background(
                    Capsule()
                        .fill(Color.green)
                )
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Header(title: "Living Dex", caught: 152)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)

            Header(title: "Living Dex", caught: 152)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
