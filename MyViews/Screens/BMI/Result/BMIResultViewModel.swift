//
//  BMIResultViewModel.swift
//  MyViews
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

    init(height: Float?, weight: Float?, router: UnownedRouter<BMIRoutes>) {
        self.height = height
        self.weight = weight
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

    private let router: UnownedRouter<BMIRoutes>
    private var height: Float?
    private var weight: Float?
    private var heightUnit = UserDefaultsImplementation.get(string: .heightUnit)
    private lazy var isMetricSystem: Bool = {
        heightUnit == HeightUnit.meters.rawValue.localized
    }()
}

extension BMIResultViewModel: BMIResultViewModelProtocol {

    // MARK: - Functions

    func finishFlow() {
        router.trigger(.finish)
    }

    // MARK: - Private functions

    private func calculateBMI() {
        guard let height = height,
              let weight = weight else { return  }
        let multiplier = isMetricSystem ? kMetricSystemMultipler : kImperialSystemMultipler
        let bmi = (weight / (pow(height, 2))) * multiplier
        self.bmi = String(format: "%.1f", bmi)
    }
}
