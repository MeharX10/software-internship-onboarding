import Foundation

// Generic function: works for any type T
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

// Generic type: stores values of any type T
struct Stack<T> {
    private var items: [T] = []

    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop() -> T? {
        return items.popLast()
    }

    func peek() -> T? {
        return items.last
    }

    var count: Int {
        items.count
    }
}

// MARK: - Testing

print("Test 1: Generic swapValues")

var x = 10
var y = 99
print("Before swap: x=\(x), y=\(y)")
swapValues(&x, &y)
print("After swap:  x=\(x), y=\(y)")
print("")

var firstName = "Bhanu"
var secondName = "FocusBear"
print("Before swap: firstName=\(firstName), secondName=\(secondName)")
swapValues(&firstName, &secondName)
print("After swap:  firstName=\(firstName), secondName=\(secondName)")
print("")

print("Test 2: Generic Stack")

var intStack = Stack<Int>()
intStack.push(5)
intStack.push(20)
intStack.push(35)

print("intStack count:", intStack.count)
print("intStack peek:", intStack.peek() ?? -1)
print("intStack pop:", intStack.pop() ?? -1)
print("intStack peek after pop:", intStack.peek() ?? -1)
print("")

var stringStack = Stack<String>()
stringStack.push("Swift")
stringStack.push("Generics")
stringStack.push("Done")

print("stringStack count:", stringStack.count)
print("stringStack peek:", stringStack.peek() ?? "nil")
print("stringStack pop:", stringStack.pop() ?? "nil")
print("stringStack peek after pop:", stringStack.peek() ?? "nil")

