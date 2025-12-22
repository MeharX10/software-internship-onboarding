# 6.6 – Error Handling (Custom Error + try/catch)

This task has been completed successfully.  
I implemented a Swift example that demonstrates **custom error definitions**, **throwing errors**, and **handling them using
try/catch**. The code was written, executed, committed, and pushed using the terminal.

---

## Objective

The goal of this task was to understand how Swift handles errors by:

- Defining a custom error type
- Throwing errors from a function
- Catching and handling errors safely using `do / try / catch`
- Preventing crashes caused by invalid input

---

## File Created

```
swift/error-handling/ErrorHandling.swift
```

This file contains:

- A custom `Error` enum
- A function that validates input and throws errors
- A wrapper function that handles errors using `try/catch`
- Multiple test cases to verify behaviour

---

## Swift Code Used

```swift
import Foundation

// MARK: - Custom Error Definition
enum LoginError: Error {
    case emptyUsername
    case emptyPassword
    case invalidCredentials
}

// MARK: - Function that throws errors
func login(username: String?, password: String?) throws -> String {

    // Guard clauses for validation
    guard let username = username, !username.isEmpty else {
        throw LoginError.emptyUsername
    }

    guard let password = password, !password.isEmpty else {
        throw LoginError.emptyPassword
    }

    // Simulated credential check
    if username != "focusbear" || password != "internbhanumacdev" {
        throw LoginError.invalidCredentials
    }

    return "Login successful. Welcome, \(username)."
}

// MARK: - try / catch usage
func performLogin(username: String?, password: String?) {
    do {
        let result = try login(username: username, password: password)
        print(result)
    } catch LoginError.emptyUsername {
        print("Error: Username cannot be empty.")
    } catch LoginError.emptyPassword {
        print("Error: Password cannot be empty.")
    } catch LoginError.invalidCredentials {
        print("Error: Invalid username or password.")
    } catch {
        print("Unexpected error: \(error)")
    }
}

// MARK: - Test cases
print("Test Case 1:")
performLogin(username: nil, password: "123")

print("\nTest Case 2:")
performLogin(username: "focusbear", password: nil)

print("\nTest Case 3:")
performLogin(username: "wrong", password: "wrong")

print("\nTest Case 4:")
performLogin(username: "focusbear", password: "internbhanumacdev")
```

---

## How I Ran the Code

From the repository root:

```
swift swift/error-handling/ErrorHandling.swift
```

---

## Terminal Output

```
Test Case 1:
Error: Username cannot be empty.

Test Case 2:
Error: Password cannot be empty.

Test Case 3:
Error: Invalid username or password.

Test Case 4:
Login successful. Welcome, focusbear.
```

This confirms:

- Errors are thrown correctly
- Each error case is handled safely
- The program does not crash
- Valid input succeeds as expected

---

## What I Learned

- Custom errors in Swift are created using `enum` that conforms to `Error`
- `guard` statements make validation clear and readable
- `throw` stops execution immediately when an error occurs
- `do / try / catch` allows handling different error cases cleanly
- Explicit error handling makes code safer and easier to maintain

---

## Git Actions Completed

- File added to the repository
- Changes committed with a clear message
- Remote changes rebased successfully
- Final push completed to `main`

Commit message used:

```
Add Swift custom error handling with try/catch example
```

---

## Screenshot Evidence

**Screenshot 1**  
Running the Swift file from the terminal and showing error handling output.

<img width="731" height="183" alt="Image" 
src="https://github.com/user-attachments/assets/b60aae37-2a92-43e3-9f7d-997ad7eb716a" />

**Screenshot 2**  
Git commit and push confirmation.

<img width="898" height="477" alt="Image" 
src="https://github.com/user-attachments/assets/9b785cfe-32cf-4d59-b293-aea057f9396f" />

---

## Final Status

- Custom error defined
- try/catch implemented correctly
- Multiple error cases tested
- Code executed successfully
- Changes committed and pushed

This task is complete and ready to be closed.
