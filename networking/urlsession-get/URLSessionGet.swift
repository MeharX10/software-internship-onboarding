import Foundation

// MARK: - Model
struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// MARK: - URL
let urlString = "https://jsonplaceholder.typicode.com/posts/1"
guard let url = URL(string: urlString) else {
    print("Invalid URL")
    exit(1)
}

print("Sending GET request to:", urlString)

// MARK: - Semaphore (for script execution)
let semaphore = DispatchSemaphore(value: 0)

// MARK: - URLSession GET request
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
        print("\n✅ JSON Response Received")
        print("----------------------------")
        print("Post ID:", post.id)
        print("User ID:", post.userId)
        print("Title:", post.title)
        print("Body:", post.body)
    } catch {
        print("❌ JSON decoding failed:", error.localizedDescription)
    }
}

// Start request
task.resume()

// Wait for async task to finish
semaphore.wait()
