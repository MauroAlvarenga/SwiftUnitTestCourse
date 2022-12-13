//
//  Add.swift
//  TestCourse
//
//  Created by Mauro Emmanuel Alvarenga on 04/11/2022.
//

import Foundation

class Add {
    
    var validNumber: ValidNumber
    
    init(validNumber: ValidNumber) {
        self.validNumber = validNumber
    }
    
    func add(num1: Int, num2: Int) -> Int {
        if(validNumber.check(number: num1) && validNumber.check(number: num2)) {
            return num1 + num2
        }
        return 0
    }
}
