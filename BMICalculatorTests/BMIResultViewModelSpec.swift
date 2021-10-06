//
//  BMIResultViewModelSpec.swift
//  BMICalculatorTests
//
//  Created by Uriel Barbosa Pinheiro on 06/10/21.
//

@testable import BMICalculator
import XCTest

class BMIResultViewModelSpec: XCTestCase {

    private var sut: BMIResultViewModelProtocol?

    func testMetricUnitsAreValid() {
        sut = BMIResultViewModel(
            heigth: 1.74,
            heigthUnit: "meters",
            weigth: 64,
            weigthUnit: "kilos",
            router: nil)
        XCTAssertEqual(Float(sut?.bmi ?? ""), 21.1)
    }

    func testImperialUnitsAreValid() {
        sut = BMIResultViewModel(
            heigth: 68.5,
            heigthUnit: "inches",
            weigth: 141,
            weigthUnit: "pounds",
            router: nil)
        XCTAssertNotNil(sut?.bmi)
        XCTAssertEqual(Float(sut?.bmi ?? ""), 21.1)
    }

    func testInvalidUnits() {
        sut = BMIResultViewModel(
            heigth: 68.5,
            heigthUnit: "banana",
            weigth: 141,
            weigthUnit: "ananas",
            router: nil)
        XCTAssertNil(Float(sut?.bmi ?? ""))
    }

    func testNoWeight() {
        sut = BMIResultViewModel(
            heigth: nil,
            heigthUnit: "inches",
            weigth: 141,
            weigthUnit: "pounds",
            router: nil)
        XCTAssertNil(Float(sut?.bmi ?? ""))
    }

    func testNoheight() {
        sut = BMIResultViewModel(
            heigth: 68.5,
            heigthUnit: "inches",
            weigth: nil,
            weigthUnit: "pounds",
            router: nil)
        XCTAssertNil(Float(sut?.bmi ?? ""))
    }
}
