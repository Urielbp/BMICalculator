//
//  WeightInputViewModel.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Foundation
import XCoordinator

protocol WeightInputViewModelProtocol: DarkModeViewModelProtocol {
    var weight: Float? { get set}
    var weightUnit: String { get }
    var errorMessage: String? { get }

    func navigateToNextScreen()
    func close()
}

class WeightInputViewModel: BaseViewModel {

    // MARK: - Variables

    var weight: Float? {
        didSet {
            validateWeight()
        }
    }
    var weightUnit: String = UserDefaultsImplementation.get(string: .weightUnit) ?? ""
    var errorMessage: String? = nil

    // MARK: - Private variables
    
    private var error: CustomError? {
        willSet {
            errorMessage = newValue?.localizedDescription ?? nil
        }
    }
    private let router: UnownedRouter<BMIRoutes>

    // MARK: - Lyfecycle and constructors

    init(router: UnownedRouter<BMIRoutes>) {
        self.router = router
        super.init()
        validateWeight()
    }
}

extension WeightInputViewModel: WeightInputViewModelProtocol {

    // MARK: - Enums

    enum CustomError: Error {
        case noInput
        case weightIsNotPositive
    }

    // MARK: - Functions

    func navigateToNextScreen() {
        guard let weight = weight else { return }
        router.trigger(.result(weight: weight))
    }

    func close() {
        router.trigger(.finish)
    }

    // MARK: - Private functions

    private func validateWeight() {
        guard let height = weight else {
            error = .noInput
            return
        }

        guard height > .zero else {
            error = .weightIsNotPositive
            return
        }
        error = nil
    }
}

// MARK: - Error message handling

extension WeightInputViewModel.CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInput:
            return "Please enter some value"
        case .weightIsNotPositive:
            return "Please enter a positive value for your weight"
        }
    }
}
