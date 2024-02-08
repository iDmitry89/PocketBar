//
//  MainScreen.swift
//  PocketBar
//
//  Created by Dmitry on 24.01.2024.
//

import SwiftUI

struct MainScreen: View {
    
    var drinks: [Drink] = []
    let drinkService = DrinksService()
    
    var body: some View {
        ScrollView {

            VStack(alignment: .center) {
                
                Text("Random Coctail: ")
                    .colorInvert()
                    .onAppear() {
                        DI.shared.drinksService.loadRandomDrinks { data in
                            for item in data.drinks {
                                print(item.strDrink)
                            }
                        }
                    }
            }
//            NavigationView {
//                List {
//                    ForEach(0..<10) {
//                        Text("Row \($0)")
//                           .tint(.white)
//                    }
//                }
//                .navigationBarTitle("Cocktails")
//            }
        }
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
    MainScreen()
}

/*
Image(systemName: "globe")
    .imageScale(.large)
    .foregroundStyle(.blue)
Text("Hello, world!")
    .colorInvert()
Spacer()

*/
