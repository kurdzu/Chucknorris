//
//  JokesAPIManager.swift
//  lecture 17
//
//  Created by omari katamadze on 05.01.23.
//

import Foundation

enum CategoriesType: Int {
    case animal = 0
    case career
    case celebrity
    case dev
    case explicit
    case fashion
    
    var endPoint: String {
        switch self {
        case .animal:
            return "category=animal"
        case .career:
            return "category=career"
        case .celebrity:
            return "category=dev"
        case .dev:
            return "category=explicit"
        case .explicit:
            return "category=explicit"
        case .fashion:
            return "category=fashion"
        }
    }
}
    protocol JokesAPIManagerProtocol {
        func fetchJoke(with type: CategoriesType, completion: @escaping (Result<Joke, Error>) -> ())
    }
    
    
    class JokesAPIManager: JokesAPIManagerProtocol {
        func fetchJoke(with type: CategoriesType, completion: @escaping (Result<Joke, Error>) -> ()) {
            let urlString = "https://api.chucknorris.io/jokes/random?\(type.endPoint)"
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    completion(.failure(error))
                }
                
                guard let data = data else { return }
                
                do {
                    let decodedData = try JSONDecoder().decode(Joke.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(decodedData))
                    }
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    


