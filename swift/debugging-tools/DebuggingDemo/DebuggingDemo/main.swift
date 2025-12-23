import Foundation

func calculateAverage(_ numbers: [Int]) -> Int {
    var total = 0

    for n in numbers {
        total += n
    }

    let average = total / numbers.count
    return average
}

let scores = [10, 20, 30, 40]
let result = calculateAverage(scores)
print("Average:", result)
