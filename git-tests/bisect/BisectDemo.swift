import Foundation

func totalScore(_ scores: [Int]) -> Int {
    return scores.reduce(0) { $0 - $1 }   // intentionally wrong
}


let scores = [5, 4, 3, 2, 1]
print("Total score:", totalScore(scores))
// minor comment
