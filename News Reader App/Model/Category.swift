//
//  Category.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import Foundation

enum NewsCategory: String, CaseIterable, Codable, Identifiable {
    case business = "Business"
    case entertainment = "Entertainment"
    case general = "General"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    case technology = "Technology"
    
    var id: String { self.rawValue }
}

