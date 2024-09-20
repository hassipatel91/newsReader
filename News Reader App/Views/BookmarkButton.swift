//
//  BookmarkButton.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import SwiftUI

struct BookmarkButton: View {
    @Binding var isBookmarked: Bool
    
    var body: some View {
        Button(action: {
            isBookmarked.toggle()
        }) {
            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                .foregroundColor(isBookmarked ? .blue : .gray)
        }
    }
}
