//
//  Book.swift
//  bookstop
//
//  Created by Ben Suskins on 21/10/2024.
//

import Foundation
import SwiftData

@Model
class Book {
    @Attribute(.unique) var id: UUID = UUID()  // Unique identifier for each book
    var title: String
    var author: String
    var category: String  // "Want to Read", "Read", etc.
    var rating: Int16     // Rating between 0 and 10
    var review: String?

    init(title: String, author: String, category: String, rating: Int16, review: String? = nil) {
        self.title = title
        self.author = author
        self.category = category
        self.rating = rating
        self.review = review
    }
}
