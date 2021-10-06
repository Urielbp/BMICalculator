//
//  WeightInputViewModelSpec.swift
//  BMICalculatorTests
//
//  Created by Uriel Barbosa Pinheiro on 06/10/21.
//

@testable import BMICalculator
import XCTest

class WeightInputViewModelSpec: XCTestCase {

    private var sut: WeightInputViewModelProtocol?

    override func setUp() {
        sut = WeightInputViewModel(router: nil)
    }

    func testWeightIsInitiallyNil() {
        sut = WeightInputViewModel(router: nil)
        XCTAssertNil(sut?.weight)
    }

    func testValidWeight() {
        sut?.weight = 22
        XCTAssertNotNil(sut?.weight)
        XCTAssertNil(sut?.errorMessage)
    }

    func testNoInputProducesInputError() {
        sut = WeightInputViewModel(router: nil)
        XCTAssertNotNil(sut?.errorMessage)
    }

    func testNegativeValueProducesError() {
        sut?.weight = -5
        XCTAssertNotNil(sut?.errorMessage)
    }
}
