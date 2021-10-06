//
//  AppCoordinator.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import UIKit
import XCoordinator

enum AppRoute: Route {
    case bmiCalculator
    case home
    case settings
}

class AppCoordinator: NavigationCoordinator<AppRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .home)
    }

    // MARK: Overrides

    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .bmiCalculator:
            return .presentFullScreen(BMICoordinator().strongRouter)
        case .home:
            let homeViewModel = HomeViewModel(router: unownedRouter)
            let viewController = HomeViewController(viewModel: homeViewModel)
            return .push(viewController)
        case .settings:
            let settingsViewModel = SettingsViewModel()
            let viewController = SettingsViewController(viewModel: settingsViewModel)
            return .push(viewController)
        }
    }
}

