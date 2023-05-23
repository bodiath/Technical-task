//
//  DataManager.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
    
    var errorDescription: String {
        switch self {
        case .badRequest:
            return "Bad request"
        case .decodingError:
            return "Decoding error"
        }
    }
}

class DataManager {
    
    private var url: URL {
        guard let url = URL(string: "https://www.swissquote.ch/mobile/iphone/Quote.action?formattedList&formatNumbers=true&listType=SMI&addServices=true&updateCounter=true&&s=smi&s=$smi&lastTime=0&&api=2&framework=6.1.1&format=json&locale=en&mobile=iphone&language=en&version=80200.0&formatNumbers=true&mid=5862297638228606086&wl=sq") else {
            preconditionFailure("Invalid URL string: \(self.url)")
        }
        return url
    }
    

    func fetchQuotes(completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.badRequest))
                return
            }
            guard let data = data else { return }
            do {
                let elements = try JSONDecoder().decode([Quote].self, from: data)
                completion(.success(elements))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
