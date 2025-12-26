//  ContentView.swift
//  DisplayAPIDataDemo
//
//  Created by Bhanu Pratap on 26/12/2025.
//

import SwiftUI

struct ContentView: View {

    /// Stores repositories fetched from the API
    @State private var repositories: [Repository] = []

    /// Stores error message if API call fails
    @State private var errorMessage: String?

    /// Controls loading state
    @State private var isLoading = false

    private let service = GitHubService()

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Apple GitHub Repositories")
                .font(.title2)
                .bold()

            if isLoading {
                ProgressView("Loading repositories…")
            }

            if let errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            List(repositories) { repo in
                VStack(alignment: .leading, spacing: 4) {

                    // Repository name
                    Text(repo.name)
                        .font(.headline)

                    // Optional description
                    if let description = repo.description {
                        Text(description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    // Metadata row
                    HStack {
                        Text("Language: \(repo.language ?? "Unknown")")
                        Spacer()
                        Text("⭐️ \(repo.stargazers_count)")
                    }
                    .font(.caption)
                }
                .padding(.vertical, 4)
            }

            Button("Load Repositories") {
                Task {
                    await loadData()
                }
            }
        }
        .padding()
        .frame(width: 600, height: 450)
    }

    /// Loads API data asynchronously and updates the UI
    private func loadData() async {
        isLoading = true
        errorMessage = nil

        do {
            repositories = try await service.fetchAppleRepositories()
        } catch {
            errorMessage = "Failed to load data: \(error.localizedDescription)"
        }

        isLoading = false
    }
}
