# Avoiding Code Duplication (DRY Principle)

## Observations

In the first program (`duplicate_example.py`), code was repeated unnecessarily:
- Each greeting and farewell was written manually for every person.
- This is hard to maintain; adding a new person requires editing multiple lines.

## Refactoring

In `refactored_example.py`, I:
- Created reusable functions `greet()` and `farewell()`
- Used a loop to apply them to a list of people

### Improvements

- Reduces repetition
- Makes code easier to maintain and extend
- Follows the DRY principle
- Output remains the same
