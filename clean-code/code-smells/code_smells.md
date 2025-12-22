# Identifying & Fixing Code Smells

## What code smells I found in my code

I created a “before” version (`OrderManagerSmelly`) that intentionally contained common code smells so I could recognise them clearly:

- **Magic numbers & strings:** tax rate and discount rates were hardcoded (e.g., `0.10`) and coupon/payment values were raw strings like `"SAVE10"` and `"CARD"`.
- **Long function:** `processOrder(...)` was doing everything (subtotal, discount rules, tax, payment message).
- **Duplicate code:** repeated formatting + repeated “Paid by …” messages, plus manual loops for summing.
- **Large class (god object):** one class was handling pricing rules, tax, payment handling, and customer/order state.
- **Deeply nested conditionals:** several levels of `if` statements made the rules hard to read and easy to break.
- **Commented-out code:** unused, commented logic cluttered the file and distracted from what actually runs.
- **Inconsistent naming:** names like `custNm` and `order_total` were unclear and inconsistent.

## How refactoring improved readability and maintainability

In the refactored version (`OrderManagerRefactored`) I improved the code by:

- Replacing raw strings with enums (`DiscountCode`, `PaymentMethod`) to reduce mistakes and make intent clear.
- Extracting smaller functions (`calculateSubtotal`, `applyDiscount`, `applyTax`, etc.) so each method does one job.
- Flattening logic using `guard` and `switch` so discount rules are easier to follow.
- Removing duplicate message-building by using a single `buildReceiptMessage(...)`.
- Grouping constants in `OrderPricingConstants` so values aren’t scattered or repeated.

This made the code easier to scan, easier to test, and safer to change.

## How avoiding code smells helps future debugging

Avoiding code smells makes debugging easier because:

- Smaller functions let me isolate the bug faster (I can test one step at a time).
- Enums and constants reduce “silent bugs” caused by typos in strings.
- Cleaner structure means I can add new rules (like a new discount code) without breaking existing ones.
- Less nesting means fewer edge cases hiding in else branches.

## Research links I used

- Code smells overview (Refactoring.Guru): https://refactoring.guru/refactoring/smells
- Martin Fowler — Refactoring (code smells / design improvements): https://martinfowler.com/books/refactoring.html
- GitHub Docs (keeping commits clean + reviewable): https://docs.github.com/en/get-started/using-git/about-git
