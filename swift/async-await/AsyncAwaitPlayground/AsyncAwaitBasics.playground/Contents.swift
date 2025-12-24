import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true // Keep playground running

// MARK: - Simulate a network request using async/await
func fetchData() async -> String {
    print("Fetching data...")
    try? await Task.sleep(nanoseconds: 2 * 1_000_000_000) // 2 seconds delay
    return "Data received successfully!"
}

// MARK: - Async function call
Task {
    let result = await fetchData()
    print(result) // Output after 2 seconds
}
