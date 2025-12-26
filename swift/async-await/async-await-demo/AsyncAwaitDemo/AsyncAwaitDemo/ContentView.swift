import SwiftUI

// Model returned by GitHub API
// Only fields we actually use
struct Repo: Decodable, Identifiable {
    let id: Int
    let name: String
    let html_url: String
}

struct ContentView: View {

    @State private var repos: [Repo] = []
    @State private var errorMessage: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text("Apple GitHub Repositories")
                .font(.title2)
                .bold()

            if let errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            List(repos) { repo in
                VStack(alignment: .leading) {
                    Text(repo.name)
                        .font(.headline)
                    Text(repo.html_url)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Button("Load Repositories") {
                Task {
                    await loadRepos()
                }
            }
        }
        .padding()
        .frame(width: 500, height: 400)
    }

    // Async networking using modern Swift concurrency
    // No completion handlers
    // No dispatch queues
    private func loadRepos() async {
        do {
            let url = URL(string: "https://api.github.com/orgs/apple/repos")!

            let (data, response) = try await URLSession.shared.data(from: url)

            guard let http = response as? HTTPURLResponse,
                  http.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }

            repos = try JSONDecoder().decode([Repo].self, from: data)

        } catch {
            errorMessage = "Network error: \(error.localizedDescription)"
        }
    }
}

