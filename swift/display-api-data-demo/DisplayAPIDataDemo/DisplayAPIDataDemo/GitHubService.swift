//  GitHubService.swift
//  DisplayAPIDataDemo
//
//  Created by Bhanu Pratap on 26/12/2025.
//

import Foundation

/// Handles fetching data from the GitHub API
final class GitHubService {

    /// Fetches repositories from the Apple organisation
    func fetchAppleRepositories() async throws -> [Repository] {

        // Real API endpoint
        let url = URL(string: "https://api.github.com/orgs/apple/repos")!

        // Async network call using modern Swift concurrency
        let (data, response) = try await URLSession.shared.data(from: url)

        // Validate HTTP response
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        // Decode JSON into Swift models
        return try JSONDecoder().decode([Repository].self, from: data)
    }
}


