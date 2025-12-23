import SwiftUI
import ApplicationServices // For Accessibility & Screen Recording

// MARK: - Permission functions
func printHeader(_ title: String) {
    print("\n==============================")
    print(title)
    print("==============================")
}

func requestScreenRecordingPermission() {
    printHeader("1) Screen Recording Permission")
    let alreadyAllowed = CGPreflightScreenCaptureAccess()
    if alreadyAllowed {
        print("✅ Screen Recording permission is already granted.")
        return
    }
    print("⚠️ Screen Recording permission is NOT granted yet.")
    let userResponded = CGRequestScreenCaptureAccess()
    print(userResponded ? "✅ User accepted request." : "❌ User did not grant request.")
}

func requestAccessibilityPermission() {
    printHeader("2) Accessibility Permission")
    let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true]
    let isTrusted = AXIsProcessTrustedWithOptions(options)
    print(isTrusted ? "✅ Accessibility permission granted." : "❌ Not granted yet. Enable in System Settings → Privacy & Security → Accessibility.")
}

// MARK: - ContentView
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Request Screen & Accessibility") {
                requestScreenRecordingPermission()
                requestAccessibilityPermission()
            }
        }
        .padding()
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
