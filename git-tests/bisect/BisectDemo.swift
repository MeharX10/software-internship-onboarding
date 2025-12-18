import Foundation

func totalScore(_ scores: [Int]) -> Int {
    return scores.reduce(0, +)
}

let scores = [5, 4, 3, 2, 1]
print("Total:", totalScore(scores))
