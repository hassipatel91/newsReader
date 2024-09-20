//
//  Article.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import Foundation

struct Article: Identifiable, Codable {
    var id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String
}

extension Article {
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
}
