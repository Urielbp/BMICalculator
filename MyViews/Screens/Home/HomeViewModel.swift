//
//  HomeViewModel.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 29/09/21.
//

import Foundation
import XCoordinator

class HomeViewModel: BaseViewModel {

    // MARK: - Private variables

    private let router: UnownedRouter<AppRoute>

    // MARK: - Lyfecycle and constructors

    init(router: UnownedRouter<AppRoute>) {
        self.router = router
        super.init()
    }

    // MARK: - Functions

    func navigateToBMICalculator() {
        router.trigger(.bmiCalculator)
    }

    func navigateToSettings() {
        router.trigger(.settings)
    }

}
