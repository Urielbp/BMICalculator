//
//  HeightInputViewModel.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 30/09/21.
//

import Foundation
import XCoordinator

protocol HeightInputViewModelProtocol: DarkModeViewModelProtocol {
    var height: Float? { get set}
    var heightUnit: String { get }
    var errorMessage: String? { get }

    func navigateToNextScreen()
    func close()
}

class HeightInputViewModel: BaseViewModel {

    // MARK: - Variables

    var height: Float? {
        didSet {
            validateHeight()
        }
    }
    var heightUnit: String = UserDefaultsImplementation.get(string: .heightUnit) ?? ""
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
        validateHeight()
    }
}

// MARK: - HeightInputViewModelProtocol

extension HeightInputViewModel: HeightInputViewModelProtocol {

    // MARK: - Enums

    enum CustomError: Error {
        case noInput
        case heightIsNotPositive
    }

    // MARK: - Functions

    func navigateToNextScreen() {
        guard let height = height else { return }
        router.trigger(.weight(height: height))
    }

    func close() {
        router.trigger(.finish)
    }

    // MARK: - Private functions

    private func validateHeight() {
        guard let height = height else {
            error = .noInput
            return
        }

        guard height > .zero else {
            error = .heightIsNotPositive
            return
        }
        error = nil
    }
}

// MARK: - Error message handling

extension HeightInputViewModel.CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInput:
            return "Please enter some value"
        case .heightIsNotPositive:
            return "Please enter a positive value for your height"
        }
    }
}
