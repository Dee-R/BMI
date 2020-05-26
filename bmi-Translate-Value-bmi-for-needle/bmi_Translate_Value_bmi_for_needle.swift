//
//  bmi_Translate_Value_bmi_for_needle.swift
//  bmi-Translate-Value-bmi-for-needle
//
//  Created by Eddy R on 21/05/2020.
//  Copyright © 2020 Eddy R. All rights reserved.
//
@testable import bmi_wheel
import XCTest


class bmi_Translate_Value_bmi_for_needle: XCTestCase {
  
  var calculBMI: CalculNeedle!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    calculBMI = CalculNeedle()
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    calculBMI = nil
  }
  
  func testImcScale () {
    // radiant sur 180
    // Arrange init [expected]
    let expected00: Float = 0 // 15
    let expected01: Float = 0 // 16
    let expected02: Float = 30 // 17.25
    let expected03: Float = 60 // 18.50
              let expected04: Float = 90 // 21.75
    let expected05: Float = 120 // 25.00
    let expected06: Float = 180 // 40
    let expected07: Float = 180 // 50
    
    // Act : execute la function [actual]
    let actual00 = CalculNeedle.calculAndScale(imc:15.00)
    let actual01 = CalculNeedle.calculAndScale(imc:16.00)
    let actual02 = CalculNeedle.calculAndScale(imc:17.25)
    let actual03 = CalculNeedle.calculAndScale(imc:18.50)
    let actual04 = CalculNeedle.calculAndScale(imc:21.75) //90
    let actual05 = CalculNeedle.calculAndScale(imc:25.00)
    let actual06 = CalculNeedle.calculAndScale(imc:40.00)
    let actual07 = CalculNeedle.calculAndScale(imc:50.00)
    
    // Assert  actual † expected
    XCTAssertEqual(actual00, expected00) //00
    XCTAssertEqual(actual01, expected01)
    XCTAssertEqual(actual02, expected02)
    XCTAssertEqual(actual03, expected03)
    XCTAssertEqual(actual04, expected04)
    XCTAssertEqual(actual05, expected05)
    XCTAssertEqual(actual06, expected06)
    XCTAssertEqual(actual07, expected07)
  }
  
}
