//
//  BookmarkListView.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import SwiftUI

struct BookmarkListView: View {
    @ObservedObject var bookmarkViewModel = BookmarkViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.red
                    .edgesIgnoringSafeArea(.top)
                Text(Constants.bookmarkTitle)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
            }
            .frame(height: 100)

            // Content area
            VStack {
                if bookmarkViewModel.bookmarkedArticles.isEmpty {
                    Text("No Bookmarked Articles")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(bookmarkViewModel.bookmarkedArticles) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            ArticleRowView(article: article)
                                .listRowBackground(Color.red.opacity(0.1))
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Preview
struct BookmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkListView()
            .preferredColorScheme(.dark) // Preview in dark mode
    }
}
