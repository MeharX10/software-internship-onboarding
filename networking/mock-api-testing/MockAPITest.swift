import Foundation

// MARK: - Model
struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// MARK: - Mock API Test
let urlString = "https://jsonplaceholder.typicode.com/posts/1"

guard let url = URL(string: urlString) else {
    print("Invalid URL")
    exit(1)
}

print("Requesting mock API:", urlString)

let semaphore = DispatchSemaphore(value: 0)

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    defer { semaphore.signal() }

    if let error = error {
        print("Network error:", error.localizedDescription)
        return
    }

    guard let data = data else {
        print("No data received")
        return
    }

    do {
        let post = try JSONDecoder().decode(Post.self, from: data)
        print("\n✅ Mock API Response Received")
        print("-----------------------------")
        print("Post ID:", post.id)
        print("User ID:", post.userId)
        print("Title:", post.title)
        print("Body:", post.body)
    } catch {
        print("❌ Failed to decode JSON:", error.localizedDescription)
    }
}

// Run the task
task.resume()
semaphore.wait()
