//
//  Favorites.swift
//  PocketBar
//
//  Created by Dmitry on 24.01.2024.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        Text("Избранное")
            .colorInvert()
            .background(
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                )
    }
}

#Preview {
    Favorites()
}
