//
//  ArticleListView.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import SwiftUI

struct ArticleListView: View {
    @ObservedObject var newsViewModel = NewsViewModel()
    @State private var selectedCategory: NewsCategory? = nil

    var body: some View {
        NavigationView {
            VStack {
                // Category Filter
                CategoryFilterView(selectedCategory: $selectedCategory)
                    .onChange(of: selectedCategory) { newCategory in
                        newsViewModel.fetchNews(for: newCategory)
                    }

                // Loading and Error Handling
                if newsViewModel.isLoading {
                    ProgressView("Loading news...")
                        .padding()
                } else if let errorMessage = newsViewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    // List of Articles
                    List(newsViewModel.filteredArticles(for: selectedCategory)) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            ArticleRowView(article: article)
                                .listRowBackground(Color.red.opacity(0.1))
                        }
                    }
                }
            }
            .navigationTitle("News")
            .toolbar {
                // Bookmark Navigation Button
                NavigationLink(destination: BookmarkListView()) {
                    Image(systemName: "bookmark")
                        .imageScale(.large)
                }
            }
            .onAppear {
                newsViewModel.fetchNews(for: selectedCategory)
            }
            .background(Color.red)
            .accentColor(.white)
        }
        .accentColor(.black)
    }
}

// Preview
struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
            .preferredColorScheme(.dark) 
    }
}


