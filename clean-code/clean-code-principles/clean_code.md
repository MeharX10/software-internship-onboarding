# Understanding Clean Code Principles (Swift)

This task has been completed successfully.  
I researched core clean code principles, analyzed a real example of messy Swift code, refactored it using clean code practices, tested both versions, and documented the
results.

---

## Objective

The goal of this task was to understand **why clean code matters** and how applying clean code principles improves **readability, safety, and long-term maintainability** in
real-world development.

---

## Clean Code Principles Studied

### 1. Simplicity

Code should do one thing clearly and avoid unnecessary complexity.  
Simple code is easier to test, debug, and extend.

---

### 2. Readability

Code should be easy to read and understand without needing extra explanation.  
Clear naming, spacing, and structure help other developers understand intent quickly.

---

### 3. Maintainability

Future developers (including myself) should be able to modify the code safely.  
Well-structured code reduces bugs when changes are required later.

---

### 4. Consistency

Using consistent naming, formatting, and patterns makes a project predictable.  
Consistency reduces cognitive load when switching between files.

---

### 5. Efficiency

Clean code balances performance with clarity.  
The goal is not premature optimisation, but writing safe and efficient logic.

---

## Messy Swift Code Example

I used a common beginner-style Swift example that contains multiple clean code issues.

**File:** `messy.swift`

### Problems in the messy code

- Uses force unwraps (`!`) which can crash the program
- Uses unclear variable names (`a`, `b`, `t`, `r`)
- Mixes validation and logic in one function
- Relies on string values like `"add"` and `"sub"`
- Does not handle invalid input safely

---

### Terminal Result (Messy Code)

When invalid input is provided, the program crashes:
**Fatal error:** Unexpectedly found nil while unwrapping an Optional value

This demonstrates why force unwraps and poor validation are dangerous.

---

## Clean Swift Code Refactor

I rewrote the same logic using clean code principles.

**File:** `clean.swift`

### Improvements Made

- Removed all force unwraps
- Used meaningful variable and function names
- Introduced enums instead of string comparisons
- Separated validation from business logic
- Added clear comments
- Implemented proper error handling

---

### Clean Code Output (Valid Input)

Result: 15

---

### Clean Code Output (Invalid Input)

Instead of crashing, the program fails safely:
`Calculation failed: invalidNumber`

---

### Screenshots

- Screenshot showing messy & clean Swift outputs (valid input)

<img width="756" height="71" alt="Image" src="https://github.com/user-attachments/assets/69d59f15-17b8-4650-a346-e18c9da2cf1a" />

---

- Screenshot showing messy & clean Swift error-handling (invalid input)

<img width="763" height="210" alt="Image" src="https://github.com/user-attachments/assets/dec2511f-061a-4aff-9926-846f977edf8e" />

<img width="758" height="30" alt="Image" src="https://github.com/user-attachments/assets/c86e9711-97c9-4713-9e41-8f846c75dbcb" />

---

## Key Learning Comparison

| Messy Code               | Clean Code                    |
| ------------------------ | ----------------------------- |
| Crashes on invalid input | Handles errors safely         |
| Hard to read             | Easy to understand            |
| Unsafe force unwraps     | Uses guard and error handling |
| Difficult to extend      | Easy to maintain and extend   |

---

## What I Learned

- Clean code prevents crashes and unexpected behaviour
- Readable code is just as important as working code
- Proper error handling makes applications safer
- Clean structure makes future changes easier
- Small design choices have long-term impact

---

## Files Added

```
clean-code/clean-code-principles/
├── messy.swift
├── clean.swift
└── clean_code.md
```

---

## Git Status

- Code tested using Swift CLI
- Changes committed and pushed to GitHub
- Commit message written clearly and meaningfully

---

## Final Status

- Clean code principles researched and documented
- Messy Swift code analyzed
- Clean Swift refactor completed
- Error cases tested and verified
- Evidence captured
- Task requirements fully met

This issue is complete and ready to be closed.
