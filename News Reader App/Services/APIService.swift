//
//  APIService.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import Combine
import Foundation

protocol APIServiceProtocol {
    func fetchArticles(for category: NewsCategory?) -> AnyPublisher<[Article], Error>
}

class APIService: APIServiceProtocol {
    static let shared = APIService()
    private init() {}

    // Fetch articles by category
    func fetchArticles(for category: NewsCategory?) -> AnyPublisher<[Article], Error> {
        var urlComponents = URLComponents(string: Constants.baseURL)!
        
        var queryItems = [URLQueryItem(name: "apiKey", value: Constants.apiKey)]
        queryItems.append(URLQueryItem(name: "country", value: Constants.countryCode))
        
        if let category = category {
            queryItems.append(URLQueryItem(name: "category", value: category.rawValue.lowercased()))
        }
        
        urlComponents.queryItems = queryItems
        
        print("API Request URL: \(urlComponents.url?.absoluteString ?? "Invalid URL")")
        
        let request = URLRequest(url: urlComponents.url!)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .handleEvents(receiveOutput: { data in
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw API Response: \(jsonString)")
                }
            })
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .map { $0.articles }
            .catch { error -> AnyPublisher<[Article], Error> in
                print("Decoding error: \(error)")
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

