//
//  APIService.swift
//  VIPERArchitecture
//
//  Created by Dean Thompson on 2022/08/10.
//

import Foundation

protocol APIManagerProtocol {
    
    func fetchQuotes(completion: @escaping ((Result<[Quote], Error>) -> Void))

}

class APIService: APIManagerProtocol {
   
    static let shared = APIService()
    
    func fetchQuotes(completion: @escaping ((Result<[Quote], Error>) -> Void)) {
        let urlString = "https://thesimpsonsquoteapi.glitch.me/quotes?count=50"
        guard let url = URL(string: urlString) else {
            print("DEBUG: invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(URLError(.badURL)))
                print("DEBUG: dataTask Error")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let quotes = try decoder.decode([Quote].self, from: data)
                completion(.success(quotes))
                
                return
                
            } catch {
                completion(.failure(URLError(.cannotDecodeContentData)))
                print("DEBUG: Unable to Decode")
                return
            }
            
        }
        .resume()
    }
}
