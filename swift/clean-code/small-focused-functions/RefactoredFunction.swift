// RefactoredFunction.swift
// This file contains small, focused functions, each with a single purpose.

import Foundation

// Function to print the numbers
func printNumbers(_ numbers: [Int]) {
    print("Numbers provided: \(numbers)")
}

// Function to sum numbers
func sumNumbers(_ numbers: [Int]) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

// Function to print odd numbers
func printOddNumbers(_ numbers: [Int]) {
    print("Odd numbers in the list:")
    for number in numbers where number % 2 != 0 {
        print(number)
    }
}

// Function to orchestrate all tasks
func processNumbersRefactored(numbers: [Int]) {
    printNumbers(numbers)
    printOddNumbers(numbers)
    let totalSum = sumNumbers(numbers)
    print("Total sum: \(totalSum)")
}

let myNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
processNumbersRefactored(numbers: myNumbers)
