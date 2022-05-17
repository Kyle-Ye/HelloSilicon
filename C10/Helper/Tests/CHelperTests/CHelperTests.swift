//
//  File.swift
//  
//
//  Created by Kyle on 2022/5/18.
//

import XCTest
import CHelper

class CHelperTests: XCTestCase {
    func testUpperText(){
        let input = "Hello World"
        var output = [CChar](repeating: 0, count: 255)
        mytoupper(input, &output)
        XCTAssertEqual(String(validatingUTF8: output) ?? "", "HELLO WORLD")
    }
    
    func testLowerText(){
        let input = "Hello World"
        var output = [CChar](repeating: 0, count: 255)
        mylower(input, &output)
        XCTAssertEqual(String(validatingUTF8: output) ?? "", "hello world")
    }
}
