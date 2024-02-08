//
//  NetworkClient.swift
//  PocketBar
//
//  Created by Dmitry on 01.02.2024.
//

import Foundation

class NetworkClient : NSObject {
    private var networkConfiguration = NetworkConfig()
    private let jsonDecoder = JSONDecoder()
    
    var outCompletionHandler: ((Result<Data,Error>)->Void)? = nil
    
    //Конфигурация
    lazy var  configuration: URLSessionConfiguration =  {
        let configuration =  URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 500
        return configuration
    }()
    
    lazy var urlSession: URLSession? = {
        return URLSession.init(configuration: configuration)
    }()
    
    private var dataTask: URLSessionDataTask? = nil
    
    func request<T:Codable>(path: String, completion: @escaping(Result<T,Error>)->Void) {
        guard let url = URL(string: "\(networkConfiguration.apiUrl)\(path)") else {
            completion(.failure(CustomError(message: "Wrong uri")))
            return
        }
        var urlRequest = URLRequest(url: url)
        let headers = networkConfiguration.headers()
        for header in headers {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }

        self.dataTask = urlSession?.dataTask(with: urlRequest, completionHandler: { [weak self] data, response, error in
            guard let self = self else {return}
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else {
                if let respn = response as? HTTPURLResponse, respn.statusCode < 200 && respn.statusCode >= 400 {
                    //error
                        completion(.failure(CustomError(message: "\(respn.statusCode)")))
                }
            }
            if let data = data {
                let json = String.init(data: data, encoding: .utf8)
                if let content = try? jsonDecoder.decode(T.self, from: data) {
                    DispatchQueue.main.async {
                        completion(.success(content))
                    }
                }
                //print(json as Any)
            }
        })
        self.dataTask?.resume()
    }
    
}

extension NetworkClient : URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        
        //let json = String.init(data: data, encoding: .utf8)
            self.outCompletionHandler?(.success(data))
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        
    }
}
