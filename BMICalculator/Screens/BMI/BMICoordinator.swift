//
//  BMIRoutes.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Foundation
import XCoordinator

enum BMIRoutes: Route {
    case height
    case weight(height: Float)
    case result(weight: Float)
    case finish
}

class BMICoordinator: NavigationCoordinator<BMIRoutes> {

    private var height: Float?
    private var weight: Float?

    init() {
        super.init(initialRoute: .height)
    }

    override func prepareTransition(for route: BMIRoutes) -> NavigationTransition {
        switch route {
        case .height:
            let viewModel = HeightInputViewModel(router: weakRouter)
            let viewController = HeightInputViewController(viewModel: viewModel)
            return .push(viewController)
        case let .weight(height):
            self.height = height
            let viewModel = WeightInputViewModel(router: weakRouter)
            let viewController = WeightInputViewController(viewModel: viewModel)
            return .push(viewController)
        case let .result(weight):
            let viemModel = BMIResultViewModel(
                heigth: self.height,
                heigthUnit: UserDefaultsImplementation.get(string: .heightUnit),
                weigth: weight,
                weigthUnit: UserDefaultsImplementation.get(string: .weightUnit),
                router: weakRouter)
            let viewController = BMIResultViewController(viewModel: viemModel)
            return .push(viewController)
        case .finish:
            return .dismiss()
        }
    }
}
