//
//  AddTest.swift
//  TestCourseTests
//
//  Created by Mauro Emmanuel Alvarenga on 13/12/2022.
//

import Foundation
import Mockingbird
import XCTest
@testable import TestCourse

class AddTest: XCTestCase {
    
    var sut: Add?
    // Create a mock using Mockingbird
    let validNumberMock: ValidNumberMock = mock(ValidNumber.self)
    let printMock: PrintMock = mock(Print.self)
    
    override func setUp() {
        self.sut = Add(validNumber: validNumberMock, print: printMock)
    }
    
    override func tearDown() {
        self.sut = nil
    }
    
    func testAdd() {
        // Given
        let expectedResult = 5
        // using given() we can define custom behaviour for mocks - Stubbing.
        given(validNumberMock.check(number: 2)).willReturn(true)
        // Shorthand syntax: '~>'
        given(validNumberMock.check(number: 3)) ~> true
        
        // When
        let result = sut?.add(num1: 2, num2: 3)
        
        // Then
        verify(validNumberMock.check(number: 2)).wasCalled()
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_add_initWithValidNumber() {
        let validNumber = ValidNumber()
        let add = Add(validNumber: validNumber)
        
        XCTAssertIdentical(add.validNumber, validNumber)
    }
    
    // AAA: Arrange -> Act -> Assert
    func testAdd_incorrectInput_usingAAAPattern() {
        // Arrange
        let expectedResult = 0
        given(validNumberMock.check(number: notNil())) ~> false // Set to false so any number will result in incorrect input
        
        // Act
        let result = sut?.add(num1: -1, num2: 25)
        
        // Assert
        XCTAssertEqual(result, expectedResult)
    }
    
    func testAddPrint() {
        // Given
        // Using wildcards: any(), any(of:), any(where:), notNil().
        given(validNumberMock.check(number: any(where: { $0 >= 0 && $0 < 10} ))) ~> true
        given(validNumberMock.check(number: any(of: 0, 1, 2, 3))) ~> true
        
        // When
        sut?.addPrint(num1: 3, num2: 9)
        
        // Then
        verify(validNumberMock.check(number: 3)).wasCalled()
        verify(validNumberMock.check(number: 9)).wasCalled()
        // We can also verify that with the argument 5, it was never called.
        verify(validNumberMock.check(number: 5)).wasNeverCalled()

    }
    
    func test_addPrint_correctInput_showsMessage() {
        // Given
        given(validNumberMock.check(number: any(where: { $0 >= 0 && $0 < 10} ))) ~> true
        
        // When
        sut?.addPrint(num1: 4, num2: 6)
        let expectedNumber = 10
        
        // Then
        verify(printMock.showMessage(number: expectedNumber)).wasCalled()
    }
    
    func test_addPrint_incorrectInput_showsError() {
        // Given
        given(validNumberMock.check(number: any(where: { $0 < 0 || $0 > 10} ))) ~> false
        
        // When
        sut?.addPrint(num1: -1, num2: 10)
        
        // Then
        verify(printMock.showError()).wasCalled()
    }
    
}
