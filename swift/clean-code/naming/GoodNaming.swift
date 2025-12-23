import Foundation

func calculateTotalMinutes(hours: Int, minutes: Int) -> Int {
    let hoursInMinutes = hours * 60
    let totalMinutes = hoursInMinutes + minutes
    return totalMinutes
}

let studyHours = 2
let extraMinutes = 30

let totalStudyTimeInMinutes = calculateTotalMinutes(
    hours: studyHours,
    minutes: extraMinutes
)

print(totalStudyTimeInMinutes)

