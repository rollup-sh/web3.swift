//
//  SolidityUtilTests.swift
//  web3swiftTests
//
//  Created by SPARK-Daniel on 2021/1/12.
//  Copyright © 2021 Argent Labs Limited. All rights reserved.
//

import XCTest
@testable import web3swift

class SolidityUtilTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testSolidityPack() {
        let result = "0x48656c6c6f03"
        let encode = try! SolidityUtil.solidityPack(types: ["string", "uint8"], values: ["Hello", "3"])
        XCTAssertEqual(result,  encode)
    }
    
    func testSolidityPack1() {
        let result = "0x68656c6c6f776f726c643031"
        let encode = try! SolidityUtil.solidityPack(types: ["string", "string"], values: ["hello", "world01"])
        XCTAssertEqual(result,  encode)
    }
    
    func testSolidityPack2() {
        let result = "0x68656c6c6f776f726c643031"
        let encode = try! SolidityUtil.solidityPack(types: ["string", "string"], values: ["helloworld", "01"])
        XCTAssertEqual(result,  encode)
    }
    
    func testSolidityPack3() {
        let result = "0x68656c6c6f776f726c643031"
        let encode = try! SolidityUtil.solidityPack(types: ["string", "string", "uint16"], values: ["hell", "oworld", "0x3031"])
        XCTAssertEqual(result,  encode)
    }
    
    func testSolidityPack4() {
        let result = "0x68656c6c6f776f726c643031"
        let encode = try! SolidityUtil.solidityPack(types: ["uint96"], values: ["32309054545061485574011236401"])
        XCTAssertEqual(result,  encode)
    }
    
    func testSolidityPack5() {
        let result = "0xff4268656c6c6f"
        let encode = try! SolidityUtil.solidityPack(types: ["int8", "bytes1", "string" ], values: ["-1", "0x42", "hello"])
        XCTAssertEqual(result,  encode)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
