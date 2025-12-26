import SwiftUI

// Main UI view shown when the macOS app launches
struct ContentView: View {

    var body: some View {
        VStack(spacing: 16) {

            // Main greeting text shown to the user
            Text("Hello, FocusBear 👋")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Supporting explanation text
            Text("This is a simple macOS Swift app created as part of onboarding.")
                .font(.body)
                .foregroundColor(.secondary)

            // Extra line to show intent clearly
            Text("Task: 7.2 – Create Simple Swift macOS App")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(40)
        .frame(minWidth: 420, minHeight: 220)
    }
}

// Preview used by Xcode for live UI rendering
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
