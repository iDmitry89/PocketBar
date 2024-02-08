//
//  ContentView.swift
//  PocketBar
//
//  Created by Dmitry on 24.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelection = 0
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            MainScreen()
                .tag(0)
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            Favorites()
                .tag(1)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
