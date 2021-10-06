//
//  HomeViewModel.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 29/09/21.
//

import Foundation
import XCoordinator

protocol HomeViewModelProtocol: DarkModeViewModelProtocol {
    func navigateToBMICalculator()
    func navigateToSettings()
}

class HomeViewModel: BaseViewModel {

    // MARK: - Private variables

    private let router: UnownedRouter<AppRoute>

    // MARK: - Lyfecycle and constructors

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
        super.init()
    }
}

// MARK: - HomeViewModelProtocol

extension HomeViewModel: HomeViewModelProtocol {

    // MARK: - Functions

    func navigateToBMICalculator() {
        router.trigger(.bmiCalculator)
    }

    func navigateToSettings() {
        router.trigger(.settings)
    }
}
