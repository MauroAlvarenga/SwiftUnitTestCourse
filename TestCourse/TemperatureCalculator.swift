//
//  TemperatureCalculator.swift
//  TestCourse
//
//  Created by Mauro Emmanuel Alvarenga on 29/08/2022.
//

import Foundation

class TemperatureCalculator {
    
    func toFahrenheit(celsius: Double) -> Double {
        return celsius * 9 / 5 + 32
    }
    
    func toCelsius(farenheit: Double) -> Double {
        return (farenheit - 32) * 5 / 9
    }
}
