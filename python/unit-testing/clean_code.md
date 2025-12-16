# Writing Unit Tests for Clean Code (Week 5)

## Testing framework chosen
I used **PyTest (Python)** because it is lightweight, fast to run from the terminal, and widely used in real projects.

## Why unit testing matters
Unit tests keep code clean because they:
- catch bugs early while changes are still small
- protect existing behaviour when refactoring
- encourage simpler, modular functions that are easy to test
- make it safer for teams to change code without breaking other features

## What I tested
I wrote unit tests for a small calculator module:
- `add(a, b)` for normal and negative numbers
- `divide(a, b)` for correct division
- division-by-zero behaviour (raises a clear error)

## Issues I found while testing
- I had to handle edge cases properly (like dividing by zero).
- Writing the test made it obvious that the function should raise a clear error message instead of failing silently.

## Evidence
- Screenshot: PyTest results (all tests passing)
<img width="945" height="197" alt="Image" src="https://github.com/user-attachments/assets/37269f35-0e85-4130-a317-3e338d81601d" />