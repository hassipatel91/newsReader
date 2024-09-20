//
//  ArticleDetailView.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import SwiftUI


struct ArticleDetailView: View {
    @ObservedObject var bookmarkViewModel = BookmarkViewModel()
    let article: Article
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.red
                    .edgesIgnoringSafeArea(.top)

                Text(article.title)
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.8)
            }
            
            // Article content
            ScrollView {
                Text(article.content ?? "No Content")
                    .padding()
            }

            Button(action: {
                if bookmarkViewModel.isBookmarked(article) {
                    bookmarkViewModel.removeBookmark(article)
                } else {
                    bookmarkViewModel.saveBookmark(article)
                }
            }) {
                Image(systemName: bookmarkViewModel.isBookmarked(article) ? "bookmark.fill" : "bookmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding(.top, 10)
            .minimumScaleFactor(0.8)
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            _ = bookmarkViewModel.isBookmarked(article)
        } 
    }
}

// Preview
struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleSource = Source(id: "", name: "")
        
        let sampleArticle = Article(
            source: sampleSource,
            author: "",
            title: "Sample Article Title",
            description: "",
            url: "",
            urlToImage: "",
            publishedAt: "",
            content: "Sample article content goes here."
        )
        
        ArticleDetailView(article: sampleArticle)
            .preferredColorScheme(.dark)
    }
}










