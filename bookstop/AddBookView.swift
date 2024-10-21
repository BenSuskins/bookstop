//
//  AddBookView.swift
//  bookstop
//
//  Created by Ben Suskins on 21/10/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context  // Access to SwiftData context

    @State private var title: String = ""
    @State private var author: String = ""
    @State private var category: String = "Want to Read"
    @State private var rating: Int = 5

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    Picker("Category", selection: $category) {
                        Text("Want to Read").tag("Want to Read")
                        Text("Read").tag("Read")
                        Text("Coming Soon").tag("Coming Soon")
                    }
                    Stepper(value: $rating, in: 0...10) {
                        Text("Rating: \(rating)/10")
                    }
                }
            }
            .navigationTitle("Add New Book")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        addBook()
                        dismiss()
                    }
                }
            }
        }
    }

    private func addBook() {
        let newBook = Book(title: title, author: author, category: category, rating: Int16(rating))
        context.insert(newBook)  // Insert into SwiftData
        do {
            try context.save()  // Save the context
        } catch {
            // Handle any errors that occur
            print("Failed to save book: \(error)")
        }
    }
}
