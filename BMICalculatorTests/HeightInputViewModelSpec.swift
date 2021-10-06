//
//  HeightInputViewModelSpec.swift
//  BMICalculatorTests
//
//  Created by Uriel Barbosa Pinheiro on 06/10/21.
//

@testable import BMICalculator
import XCTest

class HeightInputViewModelSpec: XCTestCase {

    private var sut: HeightInputViewModelProtocol?

    override func setUp() {
        sut = HeightInputViewModel(router: nil)
    }

    func testHeightIsInitiallyNil() {
        sut = HeightInputViewModel(router: nil)
        XCTAssertNil(sut?.height)
    }

    func testValidHeight() {
        sut?.height = 22
        XCTAssertNotNil(sut?.height)
        XCTAssertNil(sut?.errorMessage)
    }

    func testNoInputProducesInputError() {
        sut = HeightInputViewModel(router: nil)
        XCTAssertNotNil(sut?.errorMessage)
    }

    func testNegativeValueProducesError() {
        sut?.height = -5
        XCTAssertNotNil(sut?.errorMessage)
    }
}
