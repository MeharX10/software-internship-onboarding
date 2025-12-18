# Refactoring Code for Simplicity (Issue #69)

## Goal
The goal of this activity was to learn how to simplify overly complex code without changing what the code does. I focused on identifying unnecessary complexity, understanding why it was hard to read, and refactoring it into a clearer and more maintainable version while keeping the output exactly the same.

---

## Research and background
Refactoring for simplicity usually means breaking complex logic into smaller pieces, using clear names, and reducing mental load for the reader. Complexity often comes from large conditionals, mixed responsibilities, and logic that forces the reader to understand everything at once.

I used a real and widely referenced example from Refactoring Guru that demonstrates how complex conditional logic can be simplified using small helper functions.

Referenced sources,
Refactoring Guru, Decompose Conditional example  
https://refactoring.guru/decompose-conditional

Refactoring Guru, Refactoring techniques catalog  
https://refactoring.guru/refactoring/catalog

These sources explain why complex conditionals reduce readability and how refactoring improves clarity without changing behaviour.

---

## Original overly complex code example

The original code is based on the real example from Refactoring Guru. It works correctly, but the logic is harder to understand because multiple concerns are mixed together.

```swift
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
```

---

## Why this code was complex

The conditional mixes date logic and pricing logic together, the meaning of the condition is not obvious at first glance, rates and rules are hidden inside the function, and the reader has to mentally decode the condition before understanding what the code is doing.

---

## Refactored and simplified version

The refactored version separates responsibilities into small, clearly named functions. The logic reads closer to natural language and is easier to modify later.
```
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

```

---

## Output verification

Both versions were executed locally using the Swift command line. The output from the original and refactored files was identical, which confirms that the refactor did not change functionality.

Expected output from both files:
```
Charge, 17.00
```

### Terminal evidence:

<img width="1102" height="98" alt="Image" src="https://github.com/user-attachments/assets/53d43686-cd10-49f8-8948-0d0d8b182858" />

---

## Reflection
### What made the original code complex
The original code was complex because business rules and condition checks were tightly coupled. The conditional required understanding multiple ideas at once, date comparison, pricing rules, and service charges. This increases cognitive load and makes future changes risky.

### How refactoring improved it
Refactoring separated the logic into small, purpose driven functions. Each function now answers a single question, such as whether it is summer, or how to calculate a winter charge. The main function reads clearly and communicates intent without needing comments.

### Why simpler code helps long term
Simpler code is easier to debug because each part can be tested in isolation. It is also safer to modify, because changing one rule does not require touching unrelated logic. This reduces bugs and makes onboarding easier for new developers reading the code later.

---

## Conclusion
This task showed that refactoring is not about changing behaviour, it is about reducing complexity. By simplifying conditionals and separating responsibilities, the code became easier to read, easier to maintain, and easier to trust, while producing the exact same output.