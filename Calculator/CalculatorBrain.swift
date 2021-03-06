//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        
        if operatorType == nil {
                operand1String.append(contentsOf: digit)
        } else {
            operand2String.append(contentsOf: digit)
            return operand2String
        }
        
        return operand1String
    }
    
    func setOperator(_ operatorString: String) {
        let chosenOperator = OperatorType(rawValue: operatorString)
        operatorType = chosenOperator
        
    }

    func calculateIfPossible() -> String? {
        if operand1String != "" && operand2String != "" {
            if operatorType != nil {
                let operand1 = Double(operand1String)!
                let operand2 = Double(operand2String)!
                
                switch operatorType!.rawValue {
                case "+":
                    return String(operand1 + operand2)
                case "−":
                    return String(operand1 - operand2)
                case "×":
                    return String(operand1 * operand2)
                case "÷":
                    if operand2 == 0{
                        return "Error"
                    }
                    return String(operand1 / operand2)
                default:
                    return "0"
                }
                
            }
        }
        return "nil"
    }
}
