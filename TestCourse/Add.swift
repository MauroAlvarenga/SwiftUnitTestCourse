//
//  Add.swift
//  TestCourse
//
//  Created by Mauro Emmanuel Alvarenga on 04/11/2022.
//

import Foundation

class Add {
    
    var validNumber: ValidNumber
    var print: Print?
    
    init(validNumber: ValidNumber) {
        self.validNumber = validNumber
    }
    
    init(validNumber: ValidNumber, print: Print) {
        self.validNumber = validNumber
        self.print = print
    }
    
    func add(num1: Int, num2: Int) -> Int {
        if(validNumber.check(number: num1) && validNumber.check(number: num2)) {
            return num1 + num2
        }
        return 0
    }
    
    // Using the empty methods
    func addPrint(num1: Int, num2: Int) {
        if(validNumber.check(number: num1) && validNumber.check(number: num2)) {
            print?.showMessage(number: num1 + num2)
        } else {
            print?.showError()
        }
    }
}
