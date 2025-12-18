import Foundation

// Refactored, simpler version using small helper functions
// Reference, https://refactoring.guru/decompose-conditional

let summerStart = DateComponents(calendar: .current, year: 2025, month: 12, day: 1).date!
let summerEnd   = DateComponents(calendar: .current, year: 2026, month: 2, day: 28).date!

func isSummer(_ date: Date) -> Bool {
    date >= summerStart && date <= summerEnd
}

func winterCharge(quantity: Int) -> Double {
    let winterRate = 1.2
    let winterServiceCharge = 5.0
    return Double(quantity) * winterRate + winterServiceCharge
}

func summerCharge(quantity: Int) -> Double {
    let summerRate = 1.0
    return Double(quantity) * summerRate
}

func calculateCharge(date: Date, quantity: Int) -> Double {
    if isSummer(date) {
        return summerCharge(quantity: quantity)
    } else {
        return winterCharge(quantity: quantity)
    }
}

// Demo run, same inputs as original file
let sampleDate = DateComponents(calendar: .current, year: 2025, month: 11, day: 20).date!
let sampleQty = 10
let result = calculateCharge(date: sampleDate, quantity: sampleQty)
print(String(format: "Charge, %.2f", result))

