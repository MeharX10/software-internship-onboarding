import Foundation

// MARK: - BEFORE (Smelly Examples)

// Code Smells included below:
// 1) Magic Numbers & Strings
// 2) Long Function
// 3) Duplicate Code
// 4) Large Class / God Object
// 5) Deeply Nested Conditionals
// 6) Commented-Out Code
// 7) Inconsistent Naming

final class OrderManagerSmelly {

    // Inconsistent naming + magic string
    var custNm: String = ""
    var order_total: Double = 0.0

    // Commented-out code (clutter)
    // func oldDiscountLogic() { print("unused") }

    func processOrder(items: [String], prices: [Double], isMember: Bool, coupon: String?, paymentMethod: String) -> String {
        // Long function + magic numbers/strings + duplicate logic + nesting

        var total = 0.0

        // Duplicate code pattern (manual summing that we’ll refactor)
        for p in prices {
            total += p
        }

        // Deep nesting
        if isMember == true {
            if coupon != nil {
                if coupon == "SAVE10" { // magic string
                    total = total - (total * 0.10) // magic number
                } else {
                    if coupon == "SAVE20" {
                        total = total - (total * 0.20)
                    } else {
                        // do nothing
                    }
                }
            } else {
                // no coupon
            }
        } else {
            if coupon != nil {
                if coupon == "SAVE5" {
                    total = total - (total * 0.05)
                }
            }
        }

        // Magic number for tax
        let tax = total * 0.10
        total += tax

        // Magic string comparisons
        if paymentMethod == "CARD" {
            // Duplicate code: formatting + return message style repeated
            return "Paid by CARD. Total: \(String(format: "%.2f", total))"
        } else if paymentMethod == "CASH" {
            return "Paid by CASH. Total: \(String(format: "%.2f", total))"
        } else {
            return "Unknown payment method. Total: \(String(format: "%.2f", total))"
        }
    }
}

// MARK: - AFTER (Refactored Examples)

enum DiscountCode: String {
    case save20 = "SAVE20"
    case save10 = "SAVE10"
    case save5  = "SAVE5"
}

enum PaymentMethod: String {
    case card = "CARD"
    case cash = "CASH"
    case other
}

struct OrderPricingConstants {
    static let taxRate: Double = 0.10
}

final class OrderManagerRefactored {

    // Clear, consistent naming
    var customerName: String = ""
    private(set) var orderTotal: Double = 0.0

    func processOrder(prices: [Double], isMember: Bool, coupon: String?, paymentMethod: String) -> String {
        let subtotal = calculateSubtotal(prices: prices)
        let discounted = applyDiscount(subtotal: subtotal, isMember: isMember, coupon: coupon)
        let totalWithTax = applyTax(amount: discounted)

        self.orderTotal = totalWithTax

        let method = parsePaymentMethod(paymentMethod)
        return buildReceiptMessage(method: method, total: totalWithTax)
    }

    // Smaller functions (fixes long function smell)
    private func calculateSubtotal(prices: [Double]) -> Double {
        prices.reduce(0.0, +) // removes duplicate manual loops
    }

    // Flatter logic (fixes deeply nested conditionals)
    private func applyDiscount(subtotal: Double, isMember: Bool, coupon: String?) -> Double {
        guard let coupon, let code = DiscountCode(rawValue: coupon) else {
            return subtotal
        }

        // Example rule: members can use SAVE10 / SAVE20, non-members can only use SAVE5
        switch (isMember, code) {
        case (true, .save10):
            return subtotal * (1.0 - 0.10)
        case (true, .save20):
            return subtotal * (1.0 - 0.20)
        case (false, .save5):
            return subtotal * (1.0 - 0.05)
        default:
            return subtotal
        }
    }

    private func applyTax(amount: Double) -> Double {
        amount * (1.0 + OrderPricingConstants.taxRate) // no magic number
    }

    private func parsePaymentMethod(_ raw: String) -> PaymentMethod {
        PaymentMethod(rawValue: raw) ?? .other
    }

    // Removes duplicate return strings
    private func buildReceiptMessage(method: PaymentMethod, total: Double) -> String {
        let formattedTotal = String(format: "%.2f", total)

        switch method {
        case .card:
            return "Paid by CARD. Total: \(formattedTotal)"
        case .cash:
            return "Paid by CASH. Total: \(formattedTotal)"
        case .other:
            return "Paid by OTHER. Total: \(formattedTotal)"
        }
    }
}
