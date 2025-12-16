import Foundation
import ApplicationServices  // Accessibility + Screen Recording APIs (CoreGraphics lives here)

/// Notes:
/// - macOS permissions are managed by TCC (privacy database).
/// - Some permissions will show a system prompt once, others require manual toggle in System Settings.
/// - This script requests:
///   1) Screen Recording permission (for reading the screen / capturing)
///   2) Accessibility permission (for controlling other apps / keyboard shortcuts / automation)

func printHeader(_ title: String) {
    print("\n==============================")
    print(title)
    print("==============================")
}

func requestScreenRecordingPermission() {
    printHeader("1) Screen Recording Permission")

    // First, check current state
    let alreadyAllowed = CGPreflightScreenCaptureAccess()
    if alreadyAllowed {
        print("✅ Screen Recording permission is already granted.")
        return
    }

    print("⚠️ Screen Recording permission is NOT granted yet.")
    print("Requesting Screen Recording permission now...")

    // This triggers macOS to show a prompt (or guide us to System Settings)
    let userResponded = CGRequestScreenCaptureAccess()

    // IMPORTANT:
    // On many macOS versions, the prompt may guide us to System Settings.
    // After we enable it, we often need to quit & re-run the app/script.
    if userResponded {
        print("✅ User accepted the request (you may still need to enable it in System Settings and re-run).")
    } else {
        print("❌ User did not grant permission (or macOS requires enabling it manually in System Settings).")
    }

    // Re-check state after request attempt
    let allowedAfter = CGPreflightScreenCaptureAccess()
    print("🔎 Screen Recording allowed after request? \(allowedAfter ? "YES ✅" : "NO ❌")")
}

func requestAccessibilityPermission() {
    printHeader("2) Accessibility Permission")

    // Check current state without prompting
    let isTrusted = AXIsProcessTrusted()
    if isTrusted {
        print("✅ Accessibility permission is already granted.")
        return
    }

    print("⚠️ Accessibility permission is NOT granted yet.")
    print("Asking macOS to open Accessibility permissions...")

    // This opens the correct System Settings screen where we toggle permission for the app/terminal.
    // Note: the system usually needs us to manually enable it.
    let options: NSDictionary = [
        kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true
    ]

    let trustedAfterPrompt = AXIsProcessTrustedWithOptions(options)

    // Even after prompting, it often remains false until we manually enable it.
    print("🔎 Accessibility allowed right now? \(trustedAfterPrompt ? "YES ✅" : "NO ❌")")
    print("💡 If NO: go to System Settings → Privacy & Security → Accessibility → enable your Terminal (or the app you ran).")
}

printHeader("Permission Request Demo (2 permissions)")
print("This will check + request Screen Recording and Accessibility permissions.\n")

requestScreenRecordingPermission()
requestAccessibilityPermission()

printHeader("Done")
print("If you enabled permissions in System Settings, re-run this script to confirm the ✅ status.")
