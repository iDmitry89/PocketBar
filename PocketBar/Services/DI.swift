//
//  DI.swift
//  PocketBar
//
//  Created by Dmitry on 01.02.2024.
//

import Foundation

class DI {
    static let shared = DI()
    
    lazy var networkClient: NetworkClient = {
       return NetworkClient()
    }()
    
    lazy var drinksService: DrinksService = {
       return DrinksService(networkClient: networkClient)
    }()
    
}
