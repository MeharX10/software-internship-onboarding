# 6.5 – Closures & Higher Order Functions

This task has been completed successfully.  
I created and executed a Swift program demonstrating the use of **closures** with the higher-order functions **map**,
**filter**, and **reduce**, verified the output through the terminal, and pushed the implementation to GitHub.

---

## Objective

The goal of this task was to understand how Swift uses **closures** together with higher-order functions to process
collections in a clean, readable, and functional way.

---

## What Are Higher Order Functions

Higher-order functions are functions that:

- Take other functions (closures) as parameters, or
- Return functions as results

In Swift, `map`, `filter`, and `reduce` are commonly used higher-order functions that operate on collections like arrays.

---

## Swift Program Overview

The program works with a simple array of integers and applies:

- **map** → transforms each element
- **filter** → selects elements based on a condition
- **reduce** → combines all elements into a single value

---

## Source Code Used

```swift
// HigherOrderFunctions.swift
// Task 6.5 – Closures & Higher Order Functions

import Foundation

// Sample data
let numbers = [1, 2, 3, 4, 5, 6]

// MARK: - map
// Multiply each number by 2
let doubledNumbers = numbers.map { number in
    number * 2
}

print("Map result (doubled numbers):")
print(doubledNumbers)

// MARK: - filter
// Keep only even numbers
let evenNumbers = numbers.filter { number in
    number % 2 == 0
}

print("\nFilter result (even numbers):")
print(evenNumbers)

// MARK: - reduce
// Sum all numbers
let totalSum = numbers.reduce(0) { partialResult, number in
    partialResult + number
}

print("\nReduce result (sum of numbers):")
print(totalSum)
```

---

## Terminal Execution & Output

The program was executed using the **Swift CLI**:
`swift swift/closures-higher-order/HigherOrderFunctions.swift`

### Output

```
Map result (doubled numbers):
[2, 4, 6, 8, 10, 12]

Filter result (even numbers):
[2, 4, 6]

Reduce result (sum of numbers):
21
```

---

## Screenshot Evidence

### Screenshot 1

- Terminal showing successful execution of the Swift file
- Output for map, filter, and reduce

<img width="828" height="127" alt="Image" 
src="https://github.com/user-attachments/assets/499f9e63-10ef-4c2c-a921-f84cf76ba2eb" />

---

## What I Learned

- **Closures** allow inline, readable logic without writing separate functions.
- **map** is useful for transforming data without mutating the original array.
- **filter** makes conditional selection very clear and expressive.
- **reduce** is powerful for aggregating values like sums or totals.
- Using **higher-order functions** leads to cleaner, more readable, and more maintainable code compared to traditional loops.

---

## Final Status

- Swift closures implemented
- map, filter, and reduce demonstrated
- Program executed successfully via terminal
- Output verified
- Changes committed and pushed to GitHub

This task is complete and ready to be closed.
