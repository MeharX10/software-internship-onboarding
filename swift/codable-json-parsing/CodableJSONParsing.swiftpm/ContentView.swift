import SwiftUI

// Create a Swift struct that matches the JSON structure
// Codable allows automatic JSON decoding
struct AppInfo: Codable {
    let id: Int
    let name: String
    let isActive: Bool
    let users: Int
}

struct ContentView: View {

    // State variable to store decoded data
    @State private var appInfo: AppInfo?

    var body: some View {
        VStack(spacing: 12) {

            Text("Codable JSON Parsing")
                .font(.title)
                .fontWeight(.bold)

            // Show decoded values safely
            if let appInfo = appInfo {
                Text("App Name: \(appInfo.name)")
                Text("Users: \(appInfo.users)")
                Text("Active: \(appInfo.isActive ? "Yes" : "No")")
            } else {
                Text("Decoding JSON...")
            }
        }
        .padding()

        // Decode JSON when the view appears
        .onAppear {
            decodeJSON()
        }
    }

    // Function that handles JSON decoding
    func decodeJSON() {

        // Sample JSON string (simulating API response)
        let jsonString = """
        {
            "id": 1,
            "name": "FocusBear",
            "isActive": true,
            "users": 150
        }
        """

        // Convert JSON string to Data
        let jsonData = Data(jsonString.utf8)

        do {
            // Decode JSON into Swift struct
            let decodedData = try JSONDecoder().decode(AppInfo.self, from: jsonData)

            // Assign decoded data to state variable
            appInfo = decodedData

            // Print output to console (for verification)
            print("Decoded object:", decodedData)

        } catch {
            print("JSON Decoding failed:", error)
        }
    }
}
