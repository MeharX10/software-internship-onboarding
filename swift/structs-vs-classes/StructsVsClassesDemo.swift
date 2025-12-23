import Foundation

// MARK: - STRUCT EXAMPLE (Value Type)
// Structs are copied when assigned or passed around.
// Good for models, configs, immutable data.

struct DownloadTask {
    var fileName: String
    var progress: Int
}

// MARK: - CLASS EXAMPLE (Reference Type)
// Classes are shared by reference.
// Good for managers, controllers, shared state.

class DownloadManager {
    var activeDownloads: Int

    init(activeDownloads: Int) {
        self.activeDownloads = activeDownloads
    }
}

// MARK: - Demo Runner
func runStructVsClassDemo() {

    print("=== STRUCT (Value Type) Demo ===")

    let task1 = DownloadTask(fileName: "video.mp4", progress: 0)
    var task2 = task1   // COPY happens here

    task2.progress = 50

    print("Task1 progress:", task1.progress) // 0
    print("Task2 progress:", task2.progress) // 50
    print("Task1 unaffected because struct is copied\n")

    print("=== CLASS (Reference Type) Demo ===")

    let manager1 = DownloadManager(activeDownloads: 1)
    let manager2 = manager1   // SAME reference

    manager2.activeDownloads = 5

    print("Manager1 active downloads:", manager1.activeDownloads) // 5
    print("Manager2 active downloads:", manager2.activeDownloads) // 5
    print("Both changed because class is shared\n")
}

// Run demo
runStructVsClassDemo()
