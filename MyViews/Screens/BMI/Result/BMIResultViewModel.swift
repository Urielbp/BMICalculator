//
//  BMIResultViewModel.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Foundation
import XCoordinator

class BMIResultViewModel: BaseViewModel {

    // MARK: - Constants

    private let kImperialMultipler: Float = 703

    // MARK: - Variables

    var bmi: String = ""

    // MARK: - Private variables

    private let router: UnownedRouter<BMIRoutes>
    private var height: Float?
    private var weight: Float?
    private var heightUnit = UserDefaultsImplementation.get(string: .heightUnit)
    private lazy var isMetricSystem: Bool = {
        heightUnit == HeightUnit.meters.rawValue
    }()

    // MARK: - Lyfecycle and constructors

    init(height: Float?, weight: Float?, router: UnownedRouter<BMIRoutes>) {
        self.height = height
        self.weight = weight
        self.router = router
        super.init()
        calculateBMI()
    }

    // MARK: - Functions

    func finishFlow() {
        router.trigger(.finish)
    }

    // MARK: - Private functions

    private func calculateBMI() {
        guard let height = height,
              let weight = weight else { return  }
        let bmi = isMetricSystem ? (weight / (pow(height, 2))) :(weight / (pow(height, 2)) * kImperialMultipler)
        self.bmi = String(format: "%.1f", bmi)
    }
}
