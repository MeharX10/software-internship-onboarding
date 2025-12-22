# Error Handling and Guard Clauses in Swift

## What the original function did poorly

The first version of the function used a forced unwrap with Int(text)!.  
This caused a runtime crash when the string was not a valid number.  
There was no safety check, no guard clause and no recovery path for invalid input.  
Calling the function with "abc" immediately terminated the program.

This helped me understand how unsafe forced unwrapping is and why it should not be used when input may be unpredictable.

---

## How the refactored version improved reliability

The updated function introduced several improvements:

1. A custom error type so the problem can be clearly identified.
2. A guard clause to check for valid input before continuing.
3. A throwing function so errors can be handled by the caller.
4. A do–catch block so the program displays a readable message instead of crashing.

This approach makes the code safer because unexpected input no longer breaks the program.  
Handling errors properly allows the rest of the application to keep running, which is important in real software where invalid input is common.

---

## What I learned from this exercise

Writing code that “just works” is not enough.  
The real goal is writing code that keeps working even when something goes wrong.  
Guard clauses make the intent of the function clear and reduce nesting, and do–catch patterns help separate normal flow from error flow.  
This task made error handling feel more natural and less complicated.
