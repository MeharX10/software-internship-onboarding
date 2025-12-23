# Writing Small, Focused Functions

## Why is breaking down functions beneficial?

- Makes code easier to read and understand
- Easier to test individual components
- Reusable functions
- Simplifies debugging
- Improves maintainability

## How did refactoring improve the structure of the code?

- Original function had multiple responsibilities: printing numbers, filtering odd numbers, and summing.
- Refactored version splits these responsibilities into three focused functions.
- A main orchestration function calls the smaller functions, keeping logic clean and modular.
- Easier to extend in the future (e.g., add even number filter) without changing existing functions.

