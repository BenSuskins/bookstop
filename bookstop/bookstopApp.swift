//
//  bookstopApp.swift
//  bookstop
//
//  Created by Ben Suskins on 21/10/2024.
//
import SwiftUI
import SwiftData

@main
struct bookstopApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Book.self)  // Attach the SwiftData model
        }
    }
}
