//
//  CalculatorTests.swift
//  TestCourseTests
//
//  Created by Mauro Emmanuel Alvarenga on 03/08/2022.
//

import Foundation
import XCTest

@testable import TestCourse

class CalculatorTests: XCTestCase {
    var sut: CalculatorProtocol!
    var tempSut: TemperatureCalculator!
    var strSut: StringManager!
    
    override func setUpWithError() throws {
        self.sut = Calculator()
        self.tempSut = TemperatureCalculator()
        self.strSut = StringManager()
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
        self.tempSut = nil
        self.strSut = nil
    }
    
    // test naming format:
    // func test_MethodName_StateUnderTest_ExpectedBehaviour
    
    func test_Calculator_NotNil() {
        let message = "Sut should not be nil here."
        XCTAssertNotNil(sut, message)
    }
    
    func test_add_correctInput_correctResult() {
        // 1. Arrange
        let number1 = 10, number2 = 20
        let expectedResult = 30
        var result: Int
        
        // 2. Act
        result = sut.add(number1: number1, number2: number2)
        
        // 3. Assert
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_substract_correctInput_correctResult() {
        // Given
        let number1 = 11, number2 = 7
        let expectedResult = 4
        // When
        let result = sut.substract(number1: number1, number2: number2)
        // Then
        XCTAssertTrue(result == expectedResult)
    }
    
    func test_divide_correctInput_correctResult() {
        // Given
        let number1 = 4, number2 = 2
        let expectedResult = 2
       
        // Then
        XCTAssertNoThrow(try sut.divide(number1: number1, number2: number2))
        XCTAssertEqual(expectedResult, try sut.divide(number1: number1, number2: number2))
    }
    
    func test_divide_zeroInput_Throws() {
        // Given
        let number1 = 4, number2 = 0
        // Then
        XCTAssertThrowsError(try sut.divide(number1: number1, number2: number2))
    }
    
    func test_squareArray_correctInput_correctResult() {
        // Given
        let intArray = [2, 3, 4, 5, 6]
        let expectedResult = [4, 9, 16, 25, 36]
        // When
        let result = sut.squaredArray(intArray: intArray)
        // Then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_toFahrenheit() {
        // Given
        let celsiusArray: [Double] = [1, 2, 3, 4, 5]
        let fahrenheitArray = [33.8, 35.6, 37.4, 39.2, 41]
        // When
        let convertedCelsius = celsiusArray.map { tempSut.toFahrenheit(celsius: $0) }
        // Then
        XCTAssertEqual(fahrenheitArray, convertedCelsius)
        print(fahrenheitArray + convertedCelsius)
    }
    
    func test_toCelsius() {
        // Given
        let celsiusArray: [Double] = [1, 2, 3, 4, 5]
        let fahrenheitArray = [33.8, 35.6, 37.4, 39.2, 41]
        // When
        let convertedFarenheit = fahrenheitArray.map { tempSut.toCelsius(farenheit: $0) }
        let roundedFarenheit = convertedFarenheit.map{ $0.rounded() }
        // Then
        XCTAssertEqual(roundedFarenheit, celsiusArray)
        // Using accuracy
        for i in 0 ..< celsiusArray.count {
            XCTAssertEqual(convertedFarenheit[i], celsiusArray[i], accuracy: 0.1)
        }
    }

    func testArraySquaredMeasure() {
        var numbers = [Int]()
        for n in 1...5000000 {
            numbers.append(n)
        }
        self.measure {
            _ = sut.squaredArray(intArray: numbers)
        }
    }
    
    func testPerformanceCalculator() {
        self.measure {
            _ = try? sut.divide(number1: 26549876, number2: 29545684)
        }
    }
    
    func testToUpperCase() {
        // Given
        let message = "Esto es un mensaje"
        let expectedResult = "ESTO ES UN MENSAJE"
        
        // When
        let result = strSut.toUpperCase(message: message)
        
        // Then
        XCTAssertEqual(result, expectedResult)
    }
    
    func testToLowerCase() {
        // Given
        let message = "Esto Es OTRO MensAJe"
        let expectedResult = "esto es otro mensaje"
        
        // When
        let result = strSut.toLowerCase(message: message)
        
        // Then
        XCTAssertEqual(result, expectedResult)
    }
}
