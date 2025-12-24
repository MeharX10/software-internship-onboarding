import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: - Define networking errors
enum NetworkError: Error {
    case timeout
    case invalidURL
    case decodingFailed
}

// MARK: - Simulate fetching JSON data from a URL
func fetchJSON(from urlString: String, simulate: NetworkError?) async throws -> [String: Any] {
    
    // Check if we need to simulate a specific error
    if let error = simulate {
        switch error {
        case .timeout:
            throw NetworkError.timeout
        case .invalidURL:
            throw NetworkError.invalidURL
        case .decodingFailed:
            // Simulate invalid JSON
            let invalidJSONString = "{ name: FocusBear, users: 100 }" // missing quotes
            let invalidData = invalidJSONString.data(using: .utf8)!
            do {
                _ = try JSONSerialization.jsonObject(with: invalidData, options: [])
            } catch {
                throw NetworkError.decodingFailed
            }
        }
    }
    
    // Check if the URL string is valid
    guard URL(string: urlString) != nil else {
        throw NetworkError.invalidURL
    }
    
    // Simulate successful JSON response
    return ["name": "FocusBear", "users": 100]
}

// MARK: - Test all cases sequentially
Task {
    // 1. Timeout error
    do {
        _ = try await fetchJSON(from: "https://example.com/timeout", simulate: .timeout)
    } catch NetworkError.timeout {
        print("Error: Request timed out")
    } catch {
        print("Unexpected error: \(error)")
    }

    // 2. Invalid URL error
    do {
        _ = try await fetchJSON(from: "anything", simulate: .invalidURL)
    } catch NetworkError.invalidURL {
        print("Error: Invalid URL")
    } catch {
        print("Unexpected error: \(error)")
    }

    // 3. JSON decoding error
    do {
        _ = try await fetchJSON(from: "https://example.com/data", simulate: .decodingFailed)
    } catch NetworkError.decodingFailed {
        print("Error: JSON decoding failed")
    } catch {
        print("Unexpected error: \(error)")
    }

    // 4. Successful fetch
    do {
        let result = try await fetchJSON(from: "https://example.com/data", simulate: nil)
        print("JSON fetched successfully: \(result)")
    } catch {
        print("Unexpected error: \(error)")
    }
}
