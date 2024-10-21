//
//  ContentView.swift
//  bookstop
//
//  Created by Ben Suskins on 21/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context  // Access to SwiftData context
    @Query var books: [Book]  // Fetch all Book objects

    @State private var showingAddBookView = false

    var body: some View {
        NavigationView {
            List(books) { book in
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text(book.author)
                        .font(.subheadline)
                    Text("Category: \(book.category)")
                    Text("Rating: \(book.rating)/10")
                }
            }
            .navigationTitle("Books")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddBookView.toggle()
                    }) {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddBookView) {
                AddBookView()
            }
        }
    }
}
