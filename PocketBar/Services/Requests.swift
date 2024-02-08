//
//  Requests.swift
//  PocketBar
//
//  Created by Dmitry on 01.02.2024.
//

import Foundation

enum Requests {
    case drinksList(query: String)
    
    var path: String {
        switch self {
        case .drinksList(let query):
            return "/api/json/v1/1/\(query)"
        default:
            return ""
        }
    }
}
