//
//  NewsResponse.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

