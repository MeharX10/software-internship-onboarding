# Commenting & Documentation

## Goal
The goal of this task was to understand when comments and documentation actually add value, and when they hide problems in the code. 
Instead of writing comments everywhere, I focused on learning how good comments explain intent, context, or reasoning, while clean code 
explains itself.

---

## Research: best practices for comments and documentation

From my research, good comments are not about repeating what the code already says. They are about explaining *why* something exists, *why* 
a decision was made, or *what assumptions* the code relies on.

Poor comments usually happen when code is hard to read. In that case, the real fix is improving names, structure, or logic, not adding more 
comments.

Key ideas I learned:

- Comments should explain intent, not syntax.
- Comments should document nonobvious decisions.
- Comments should warn about side effects or constraints.
- Comments should be removed if they no longer reflect reality.

References used:-
Clean Code by Robert C Martin, Chapter on Comments  
https://www.oreilly.com/library/view/clean-code/9780136083238/

Martin Fowler, Refactoring and Self-Documenting Code  
https://martinfowler.com/bliki/CodeAsDocumentation.html

---

## Example of poorly commented code

The example below shows code where comments repeat the obvious, hide bad naming, and fail to explain intent.

```swift
// This function calculates total
func calc(x: Double, y: Double) -> Double {
    // add x and y
    let z = x + y
    
    // return z
    return z
}
```

---

## What is wrong here

- The comments add no value.
- The function name does not explain what total means.
- The variable names x, y, z give no context.
- Anyone reading this still has to guess what the function is actually for.

---

## Refactored version with meaningful documentation
Instead of adding more comments, I improved the code so most comments became unnecessary. I only kept documentation where it added clarity.
```
/// Calculates the final bill amount by adding the base price and tax.
/// This function assumes taxAmount is already calculated elsewhere.
func calculateFinalBill(basePrice: Double, taxAmount: Double) -> Double {
    basePrice + taxAmount
}
```

### Why this is better

- The function name explains intent clearly.
- The parameter names describe their role.
- The documentation comment explains assumptions.
- No inline comments are needed because the code is readable.

---

## When should you add comments

- You should add comments when.
- You need to explain why a decision was made.
- The code relies on business rules that are not obvious.
- There are edge cases or constraints that are easy to forget.
- You are documenting public APIs for other developers.

In these cases, comments prevent misunderstandings and future bugs.

---

## When should you avoid comments and improve the code instead

- You should avoid comments when.
- They only restate what the code already says.
- They explain confusing variable names or logic.
- They are used to justify messy or rushed code.

In these situations, the **correct fix** is to,

- Rename variables and functions.
- Break large functions into smaller ones.
- Simplify logic and remove unnecessary branches.

Clean code reduces the need for comments.

---

## Personal reflection

While doing this task, I realised that comments are not a substitute for clarity. In the poorly commented example, the comments existed 
only because the code itself was unclear. After refactoring, the code became self explanatory, and the comments shifted from describing 
actions to explaining intent.

This approach makes the code easier to maintain, easier to debug, and safer to change in the future, especially when someone else reads it 
months later.

---

