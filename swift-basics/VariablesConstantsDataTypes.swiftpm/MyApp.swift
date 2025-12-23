import Foundation

// MARK: - Variables, Constants & Data Types Demo
// Task 6.1 — Swift Basics
// Author: Bhanu Pratap

@main
struct SwiftBasicsDemo {

    static func main() {

        // ---------------------------
        // Constants (let)
        // ---------------------------
        let appName: String = "FocusBear"
        let maxRetryCount = 3
        let isProduction = false

        // ---------------------------
        // Variables (var)
        // ---------------------------
        var currentRetry = 0
        currentRetry += 1

        var progress: Double = 0.0
        progress = 75.5

        // ---------------------------
        // Common Data Types
        // ---------------------------
        let username: String = "bhanu"
        let age: Int = 24
        let height: Float = 5.9
        let accountBalance: Double = 1200.75
        let isLoggedIn: Bool = true

        // ---------------------------
        // Type Inference vs Explicit Types
        // ---------------------------
        let inferredScore = 95
        let inferredRating = 4.5

        let explicitScore: Int = 95
        let explicitRating: Double = 4.5

        // ---------------------------
        // Output
        // ---------------------------
        print("=== Variables & Constants Demo ===")
        print("App Name:", appName)
        print("Retries:", currentRetry, "/", maxRetryCount)
        print("Progress:", progress, "%")
        print("User:", username)
        print("Logged In:", isLoggedIn)
        print("Age:", age)
        print("Height:", height)
        print("Account Balance:", accountBalance)
        print("Explicit Score:", explicitScore)
        print("Explicit Rating:", explicitRating)
        print("Is Production:", isProduction)
        print("Inferred Score:", inferredScore)
        print("Inferred Rating:", inferredRating)
    }
}
