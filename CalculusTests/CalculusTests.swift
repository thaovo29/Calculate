//
//  CalculusTests.swift
//  CalculusTests
//
//  Created by Thao Vo on 13/10/2023.
//

import XCTest
@testable import Calculus

final class CalculusTests: XCTestCase {

    var calculateVM = CalculusViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCalculateAdd() {
        calculateVM.firstNum = "1"
        calculateVM.secondNum = "4"
        calculateVM.calOperator = .add
        calculateVM.cal()
        XCTAssertTrue(calculateVM.ans == "Answer: 5")
    }
    
    func testCalculateMinus() {
        calculateVM.firstNum = "1"
        calculateVM.secondNum = "4"
        calculateVM.calOperator = .minus
        calculateVM.cal()
        XCTAssertTrue(calculateVM.ans == "Answer: -3")
    }
    
    func testCalculateMultiply() {
        calculateVM.firstNum = "2"
        calculateVM.secondNum = "4"
        calculateVM.calOperator = .multiply
        calculateVM.cal()
        XCTAssertTrue(calculateVM.ans == "Answer: 8")
    }

    func testCalculateDivide() {
        calculateVM.firstNum = "2"
        calculateVM.secondNum = "4"
        calculateVM.calOperator = .divide
        calculateVM.cal()
        XCTAssertTrue(calculateVM.ans == "Answer: 0.5")
    }
    
    func testCalculateDivideByZero() {
        calculateVM.firstNum = "2"
        calculateVM.secondNum = "0"
        calculateVM.calOperator = .divide
        calculateVM.cal()
        XCTAssertTrue(calculateVM.errorMessage == "Error: Divided by zero")
    }
    
    func testCalculateNotNumbers() {
        calculateVM.firstNum = "Two"
        calculateVM.secondNum = "Three"
        calculateVM.calOperator = .divide
        calculateVM.cal()
        XCTAssertTrue(calculateVM.errorMessage == "Error: Not numbers")
    }
}
