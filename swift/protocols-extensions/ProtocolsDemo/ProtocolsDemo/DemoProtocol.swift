import Foundation

// MARK: - Protocol
protocol Greetable {
    var name: String { get }
    func greet()
}

// MARK: - Default Implementation via Extension
extension Greetable {
    func greet() {
        print("Hello, \(name)! Welcome to Protocols & Extensions demo.")
    }
}

// MARK: - Struct using protocol
struct User: Greetable {
    var name: String
}

// MARK: - Example Usage
func runDemo() {
    let user1 = User(name: "Bhanu")
    user1.greet()  // Uses default implementation
}
