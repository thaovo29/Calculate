//
//  CalculusViewModel.swift
//  Calculus
//
//  Created by Thao Vo on 13/10/2023.
//

import Foundation

class CalculusViewModel: ObservableObject {
    @Published var firstNum: String = ""
    @Published var secondNum: String = ""
    @Published var calOperator: CalculusOperator = .add
    @Published var operatorOptions: [CalculusOperator] = [.add, .minus, .multiply, .divide]
    @Published var errorMessage: String = ""
    @Published var ans: String = ""
    
    func calculate() throws -> Float {
        guard let firstNum = Float(firstNum), let secondNum = Float(secondNum) else {
            throw CalculateError.notNumber
        }
        switch calOperator {
        case .add:
            return firstNum + secondNum
        case .minus:
            return firstNum - secondNum
        case .multiply:
            return firstNum * secondNum
        case .divide:
            if secondNum == 0 {
                throw CalculateError.divideByZero
            } else {
                return firstNum / secondNum
            }
        }
    }
    
    func cal() {
        do {
            let result = try calculate()
            ans = "Answer: \(result.clean)"
            errorMessage = ""
        } catch let error as CalculateError {
            errorMessage = error.rawValue
            ans = ""
        } catch {
            
        }
    }
}

enum CalculusOperator: String {
    case add = "+"
    case minus = "-"
    case multiply = "*"
    case divide = "/"
    
    var allCase: [String] {
        return ["+", "-", "*", "/"]
    }
}

enum CalculateError: String, Error{
    case divideByZero = "Error: Divided by zero"
    case notNumber = "Error: Not numbers"
}

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
