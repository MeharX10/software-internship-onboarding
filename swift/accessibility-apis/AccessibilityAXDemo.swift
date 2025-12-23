import Cocoa
import ApplicationServices

print("AX Trusted:", AXIsProcessTrusted())

// Get the system-wide accessibility object
let systemWideElement = AXUIElementCreateSystemWide()

var attributeNames: CFArray?

let result = AXUIElementCopyAttributeNames(
    systemWideElement,
    &attributeNames
)

// Handle result
if result == .success, let attributes = attributeNames as? [String] {
    print("Successfully interacted with AX API.")
    print("Available AX attributes:")
    for attribute in attributes {
        print("- \(attribute)")
    }
} else {
    print("Failed to retrieve AX attributes.")
}