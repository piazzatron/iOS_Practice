//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Michael Piazza on 6/21/15.
//  Copyright (c) 2015 QuickSorta. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    
    private enum Op {
        case Operand(Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
    }
    private var opStack = [Op]()
    
    private var knownOps = [String:Op]()
    
    init() {
        knownOps["*"] = Op.BinaryOperation("*", *)
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["-"] = Op.BinaryOperation("-"){$1 - $0}
        knownOps["/"] = Op.BinaryOperation("/"){$1 / $0}
    }
    
    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand((operand)))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double?{
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op])
    {
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
            switch op {
                
            case .Operand(let operand):
                return (operand, remainingOps)
                
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            }
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack)
        return result
    }
    
}