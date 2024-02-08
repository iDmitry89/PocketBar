//
//  NetworkConfig.swift
//  PocketBar
//
//  Created by Dmitry on 01.02.2024.
//

import Foundation

class NetworkConfig {
    let apiUrl = "https://www.thecocktaildb.com"
    let apiKey = "1"

    func headers()->[String:String] { return ["X-Api-Key":apiKey]
    }
}
