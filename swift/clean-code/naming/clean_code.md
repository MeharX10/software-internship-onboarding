# Clear and Meaningful Variable & Function Naming
## Goal
The goal of this task was to understand how clear and meaningful names for variables and functions improve code readability, maintainability, and overall code quality.

---

## Research Summary
Good naming is a core principle of clean code. Clear variable and function names should describe what the code does, not how the reader should guess its meaning. Well-named code reduces the need for comments, prevents misunderstandings, and makes collaboration easier.

Industry best practices recommend:

- Using descriptive, intention-revealing names
- Avoiding abbreviations and single-letter variables (except in very small scopes)
- Making function names describe actions
- Including units or context where relevant (e.g. minutes, hours)

---

## Example of Poor Naming
The following Swift code works correctly but is difficult to understand due to unclear naming:
```
func f(_ a: Int, _ b: Int) -> Int {
    let x = a * 60
    let y = b
    let z = x + y
    return z
}

let v1 = 2
let v2 = 30

let r = f(v1, v2)
print(r)
```

## Issues:

- The function name `f` gives no information about its purpose
- Variables `a`, `b`, `x`, `y`, and `z` have no semantic meaning
- The reader must mentally infer that values represent time

---

## Refactored Version with Clear Naming
The same logic was refactored using meaningful names without changing behavior:
```
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
```

---

## Improvements:

- The function name clearly explains its purpose
- Variable names describe intent and units
- Code becomes self-documenting
- No additional comments are required to understand the logic

## Reflections
What makes a good variable or function name?

- A good name is descriptive, intention-revealing, and unambiguous. It should clearly communicate what the value represents or what the function does without requiring external explanation.

What issues can arise from poorly named variables?

- Poor naming can cause confusion, introduce bugs, slow down development, and make maintenance difficult. Developers may misinterpret logic, especially in larger or shared codebases.

How did refactoring improve code readability?

- Refactoring improved readability by making the purpose of each variable and function immediately clear. The logic became easier to follow, reducing mental effort and improving long-term maintainability.

---

## Screenshots

- Terminal Output

<img width="378" height="71" alt="Image" src="https://github.com/user-attachments/assets/dd732285-1c9a-4a12-8f50-2476bb540e2d" />

---
