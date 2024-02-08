//
//  DrinksService.swift
//  PocketBar
//
//  Created by Dmitry on 01.02.2024.
//

import Foundation

class DrinksService {
    private var networkClient: NetworkClient?
    
    init(networkClient: NetworkClient? = nil) {
        self.networkClient = networkClient
    }

    func loadRandomDrinks(query: String = "random.php", completion: @escaping(DrinkArray)->Void) {
        self.networkClient?.outCompletionHandler = { result  in
            switch result {
            case .success(let data):
                if let content = try?  JSONDecoder().decode(DrinkArray.self, from: data) {
                    completion(content)
                    //print(content)
                }
            default:
                break
            }
            
        }
      
        networkClient?.request(path: Requests.drinksList(query: query).path) { (result: Result<DrinkArray,Error>) in
            switch result {
            case .success(let data) :
//                for drink in data.drinks {
//                    print(drink)
//                }
                completion(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
