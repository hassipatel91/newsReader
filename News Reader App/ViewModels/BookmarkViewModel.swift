//
//  BookmarkViewModel.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import Foundation
import Combine

class BookmarkViewModel: ObservableObject {
    @Published var bookmarkedArticles: [Article] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadBookmarks()
    }
    
    func loadBookmarks() {
        self.bookmarkedArticles = PersistenceManager.shared.loadBookmarks()
    }
    
    func saveBookmark(_ article: Article) {
        PersistenceManager.shared.saveBookmark(article)
        loadBookmarks()
    }
    
    func removeBookmark(_ article: Article) {
        PersistenceManager.shared.removeBookmark(article)
        loadBookmarks()
    }
    
    func isBookmarked(_ article: Article) -> Bool {
        return PersistenceManager.shared.isBookmarked(article)
    }
    
    // Toggle bookmark status
    func toggleBookmark(for article: Article) {
        if isBookmarked(article) {
            removeBookmark(article)
        } else {
            saveBookmark(article)
        }
    }
}
