import Foundation
import ApplicationServices

// Create system-wide accessibility object
let systemWideElement = AXUIElementCreateSystemWide()

// Attempt to read the currently focused UI element
var focusedElement: AnyObject?

let result = AXUIElementCopyAttributeValue(
    systemWideElement,
    kAXFocusedUIElementAttribute as CFString,
    &focusedElement
)

if result == .success {
    print("Focused UI element retrieved successfully")
    print("AX Element:", focusedElement ?? "Unknown")
} else {
    print("Failed to retrieve focused UI element")
}
