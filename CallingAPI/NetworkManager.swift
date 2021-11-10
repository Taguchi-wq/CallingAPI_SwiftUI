//
//  NetworkManager.swift
//  CallingAPI
//
//  Created by cmStudent on 2021/11/10.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Codable>(_ url: URL, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else { return }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(objects))
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
