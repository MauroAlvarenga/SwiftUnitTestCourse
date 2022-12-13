//
//  ValidNumber.swift
//  TestCourse
//
//  Created by Mauro Emmanuel Alvarenga on 21/10/2022.
//

import Foundation

class ValidNumber {
    // Checks if a number is a Valid Number. We consider Valid Number a number that is positive and < 10
    func check(number: Int) -> Bool {
        number >= 0 && number < 10
    }
}
