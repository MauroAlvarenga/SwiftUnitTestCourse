//
//  Calculator.swift
//  TestCourse
//
//  Created by Mauro Emmanuel Alvarenga on 03/08/2022.
//

import Foundation

protocol CalculatorProtocol {
    func add(number1: Int, number2: Int) -> Int
    func substract(number1: Int, number2: Int) -> Int
    func divide(number1: Int, number2: Int) -> Int
    func divideByZero(number1: Int, number2: Int) throws -> Int
    func squaredArray(intArray: [Int]) -> [Int]
}

class Calculator: CalculatorProtocol {
    
    func add(number1: Int, number2: Int) -> Int {
        number1 + number2
    }
    
    func substract(number1: Int, number2: Int) -> Int {
        number1 - number2
    }
    
    func divide(number1: Int, number2: Int) -> Int {
        number1 / number2
    }
    
    func divideByZero(number1: Int, number2: Int) throws -> Int {
        if (number2 == 0) {
            throw CalculatorError.DivideByZeroError
        }
        return number1 / number2
    }
    
    // Ejercicio 1.1 Dado un array de enteros, devolver un array de enteros ^ al cuadrado.
    func squaredArray(intArray: [Int]) -> [Int] {
        return intArray.map { $0 * $0 }
    }
    
    
}

enum CalculatorError: Error {
    case DivideByZeroError
}
