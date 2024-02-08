//
//  DrinkItems.swift
//  PocketBar
//
//  Created by Dmitry on 29.01.2024.
//

import Foundation

struct DrinkArray: Codable {
    let drinks: [Drink]
}

struct Drink: Codable {
    let strDrink: String
    let strinstruction: String
    let strDrinkThumb: String
    let strIngrigient1: String?
    let strIngrigient2: String?
    let strIngrigient3: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    
}

class CustomError: Error {
    var message: String
    init(message: String) {
        self.message = message
    }
    
}
