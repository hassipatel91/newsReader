//
//  PersistenceManager.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import Foundation

class PersistenceManager {
    
    static let shared = PersistenceManager() 
    private let bookmarksKey = Constants.bookmarksKey
    
    private init() {} // Prevent instantiation
    
    // Save an article to bookmarks
    func saveBookmark(_ article: Article) {
        var bookmarks = loadBookmarks()
        
        // Check if the article is already bookmarked
        if !bookmarks.contains(where: { $0.title == article.title }) {
            bookmarks.append(article)
            save(bookmarks: bookmarks)
        }
    }
    
    // Remove an article from bookmarks
    func removeBookmark(_ article: Article) {
        var bookmarks = loadBookmarks()
        bookmarks.removeAll { $0.title == article.title }
        save(bookmarks: bookmarks)
    }
    
    // Check if an article is bookmarked
    func isBookmarked(_ article: Article) -> Bool {
        let bookmarks = loadBookmarks()
        return bookmarks.contains(where: { $0.title == article.title })
    }
    
    // Load all bookmarked articles
    func loadBookmarks() -> [Article] {
        if let data = UserDefaults.standard.data(forKey: bookmarksKey),
           let bookmarks = try? JSONDecoder().decode([Article].self, from: data) {
            return bookmarks
        }
        return []
    }
    
    // Save the bookmarks to UserDefaults
    private func save(bookmarks: [Article]) {
        if let data = try? JSONEncoder().encode(bookmarks) {
            UserDefaults.standard.set(data, forKey: bookmarksKey)
        }
    }
}

