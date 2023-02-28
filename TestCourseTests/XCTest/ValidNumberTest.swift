//
//  ValidNumberTest.swift
//  TestCourseTests
//
//  Created by Mauro Emmanuel Alvarenga on 21/10/2022.
//

import Foundation
import XCTest
@testable import TestCourse

class ValidNumberTest: XCTestCase {
    var sut: ValidNumber!
    
    override func setUp() {
        self.sut = ValidNumber()
    }
    
    override func tearDown() {
        self.sut = nil
    }
    
    func testCheckValidNumber() {
        XCTAssertTrue(sut.check(number: 4))
    }
    
    func testCheckNotValidNumber() {
        XCTAssertFalse(sut.check(number: -4))
        XCTAssertFalse(sut.check(number: 10))
    }
}
