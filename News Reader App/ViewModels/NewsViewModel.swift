//
//  NewsViewModel.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private var apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService.shared) {
        self.apiService = apiService
    }
    
    func fetchNews(for category: NewsCategory?) {
        isLoading = true
        errorMessage = nil
        
        apiService.fetchArticles(for: category)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] articles in
                self?.articles = articles
            })
            .store(in: &cancellables)
    }
    
    func filteredArticles(for category: NewsCategory?) -> [Article] {
        if let category = category {
            return articles.filter { $0.title.contains(category.rawValue) }
        } else {
            return articles
        }
    }
}


