import Foundation

// Original, overly complex conditional style, inspired by the "Decompose Conditional" example
// Reference, https://refactoring.guru/decompose-conditional

let summerStart = DateComponents(calendar: .current, year: 2025, month: 12, day: 1).date!
let summerEnd   = DateComponents(calendar: .current, year: 2026, month: 2, day: 28).date!

func calculateCharge(date: Date, quantity: Int) -> Double {
    let winterRate = 1.2
    let winterServiceCharge = 5.0
    let summerRate = 1.0

    var charge = 0.0

    if date < summerStart || date > summerEnd {
        charge = Double(quantity) * winterRate + winterServiceCharge
    } else {
        charge = Double(quantity) * summerRate
    }

    return charge
}

// Demo run
let sampleDate = DateComponents(calendar: .current, year: 2025, month: 11, day: 20).date!
let sampleQty = 10
let result = calculateCharge(date: sampleDate, quantity: sampleQty)
print(String(format: "Charge, %.2f", result))

