//
//  BMIResultViewModel.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Foundation

class BMIResultViewModel: BaseViewModel {
    // MARK: - Bindable variables

    private var height: Float?
    private var weight: Float?
    @Published var bmi: String = ""

    // MARK: - Lyfecycle and constructors

    init(height: Float?, weight: Float?) {
        self.height = height
        self.weight = weight
        super.init()
        calculateBMI()
    }

    private func calculateBMI() {
        guard let height = height,
              let weight = weight else { return  }
        let bmi = weight / (pow(height, 2))
        self.bmi = String(format: "%.1f", bmi)
    }
}
