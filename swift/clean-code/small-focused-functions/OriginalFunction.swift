// OriginalFunction.swift
// This file contains a long, complex function that does multiple tasks in one.

import Foundation

// Function that prints details of numbers, calculates sum, and prints odd numbers
func processNumbers(numbers: [Int]) {
    print("Numbers provided: \(numbers)")
    
    var sum = 0
    print("Odd numbers in the list:")
    for number in numbers {
        sum += number
        if number % 2 != 0 {
            print(number)
        }
    }
    
    print("Total sum: \(sum)")
}

let myNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
processNumbers(numbers: myNumbers)
