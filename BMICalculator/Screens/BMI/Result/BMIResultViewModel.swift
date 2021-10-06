//
//  BMIResultViewModel.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Foundation
import XCoordinator

protocol BMIResultViewModelProtocol: DarkModeViewModelProtocol {
    var bmi: String { get }

    func finishFlow()
}

class BMIResultViewModel: BaseViewModel {

    // MARK: - Lyfecycle and constructors

    init(heigth: Float?,
         heigthUnit: String?,
         weigth: Float?,
         weigthUnit: String?,
         router: WeakRouter<BMIRoutes>?) {
        self.heigth = heigth
        self.heigthUnit = heigthUnit
        self.weigth = weigth
        self.weigthUnit = weigthUnit
        self.router = router
        super.init()
        calculateBMI()
    }

    // MARK: - Constants

    private let kImperialSystemMultipler: Float = 703
    private let kMetricSystemMultipler: Float = 1

    // MARK: - Variables

    var bmi: String = ""

    // MARK: - Private variables

    private let router: WeakRouter<BMIRoutes>?
    private var heigth: Float?
    private var weigth: Float?
    private var heigthUnit: String?
    private var weigthUnit: String?
    private lazy var isMetricSystem: Bool = {
        heigthUnit == HeightUnit.meters.rawValue.localized && weigthUnit == WeightUnit.kilos.rawValue.localized
    }()
    private lazy var isImperialSystem: Bool = {
        heigthUnit == HeightUnit.inches.rawValue.localized && weigthUnit == WeightUnit.pounds.rawValue.localized
    }()
    private lazy var isUnitValidSystem: Bool = {
        (isMetricSystem || isImperialSystem) && (isMetricSystem != isImperialSystem)
    }()
    private var error: CustomError? {
        willSet {
            bmi = newValue?.localizedDescription ?? ""
        }
    }
}

extension BMIResultViewModel: BMIResultViewModelProtocol {

    // MARK: - Enums

    enum CustomError: Error {
        case invalidUnits
        case noWeightValue
        case noHeightValue
    }

    // MARK: - Functions

    func finishFlow() {
        router?.trigger(.finish)
    }

    // MARK: - Private functions

    private func calculateBMI() {
        guard let heigth = heigth else {
            error = .noHeightValue
            return
        }

        guard let weigth = weigth else {
            error = .noWeightValue
            return
        }

        guard isUnitValidSystem else {
            error = .invalidUnits
            return
        }
        let multiplier = isMetricSystem ? kMetricSystemMultipler : kImperialSystemMultipler
        let bmi = (weigth / (pow(heigth, 2))) * multiplier
        self.bmi = String(format: "%.1f", bmi)
    }
}

// MARK: - Error message handling

extension BMIResultViewModel.CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidUnits:
            return "bmi.result.error.invalid.units".localized
        case .noHeightValue:
            return "bmi.result.error.no.height".localized
        case .noWeightValue:
            return "bmi.result.error.no.weight".localized
        }
    }
}
