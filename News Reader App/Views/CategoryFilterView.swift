//
//  CategoryFilterView.swift
//  News Reader App
//
//  Created by Sukh Vilas on 19/09/24.
//

import SwiftUI

struct CategoryFilterView: View {
    @Binding var selectedCategory: NewsCategory?
    
    var categories: [NewsCategory] = NewsCategory.allCases
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(categories) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        Text(category.rawValue)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(selectedCategory == category ? Color.red : Color.gray.opacity(0.2)) // Active category color
                            .foregroundColor(selectedCategory == category ? .white : .black) // Text color
                            .cornerRadius(20)
                    }
                }
            }
            .padding()
            .background(Color.red.opacity(0.1)) // Background for the filter view
        }
    }
}

// Preview
struct CategoryFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFilterView(selectedCategory: .constant(.general))
            .preferredColorScheme(.dark) // Preview in dark mode
    }
}

