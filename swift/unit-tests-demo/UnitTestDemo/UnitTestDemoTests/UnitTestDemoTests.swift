import XCTest
@testable import UnitTestDemo

final class UnitTestDemoTests: XCTestCase {

    var calculator: Calculator!

    // Setup method runs before each test
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    // Teardown method runs after each test
    override func tearDown() {
        calculator = nil
        super.tearDown()
    }

    // Test 1: Addition
    func testAddition() {
        let result = calculator.add(3, 5)
        XCTAssertEqual(result, 8, "Addition should return 8")
    }

    // Test 2: Subtraction
    func testSubtraction() {
        let result = calculator.subtract(10, 4)
        XCTAssertEqual(result, 6, "Subtraction should return 6")
    }

    // Test 3: Multiplication
    func testMultiplication() {
        let result = calculator.multiply(6, 7)
        XCTAssertEqual(result, 42, "Multiplication should return 42")
    }
}
