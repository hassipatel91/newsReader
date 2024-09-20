//
//  ArticleRowView.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import SwiftUI

struct ArticleRowView: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .font(.headline)
            
            if let description = article.description {
                Text(description)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 8)
    }
}

