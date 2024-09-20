//
//  MockAPIService.swift
//  News Reader AppUITests
//
//  Created by Sukh Vilas on 20/09/24.
//

import XCTest
import Combine
@testable import News_Reader_App


class MockAPIService: APIServiceProtocol {
    var shouldReturnError = false
    
    func fetchArticles(for category: NewsCategory?) -> AnyPublisher<[Article], Error> {
        if shouldReturnError {
            return Fail(error: NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock error"]))
                .eraseToAnyPublisher()
        } else {
            let sampleArticles = [
                Article(source: Source(id: "1", name: "Source 1"),
                        author: "Author 1",
                        title: "Technology News",
                        description: "Tech news description",
                        url: "https://example.com/1",
                        urlToImage: nil,
                        publishedAt: "2024-09-20T12:00:00Z",
                        content: "Sample content 1"),
                Article(source: Source(id: "2", name: "Source 2"),
                        author: "Author 2",
                        title: "Health News",
                        description: "Health news description",
                        url: "https://example.com/2",
                        urlToImage: nil,
                        publishedAt: "2024-09-20T12:00:00Z",
                        content: "Sample content 2")
            ]
            return Just(sampleArticles)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}



