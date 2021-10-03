//
//  WeightInputViewModel.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Foundation

class WeightInputViewModel: BaseViewModel {

    // MARK: - Bindable variables

    @Published var weight: Float? {
        didSet {
            validateWeight()
        }
    }
    @Published var errorMessage: String? = nil

    // MARK: - Variables

    private var error: CustomError? {
        willSet {
            errorMessage = newValue?.localizedDescription ?? nil
        }
    }

    // MARK: - Enums

    enum CustomError: Error {
        case noInput
        case weightIsNotPositive
    }

    // MARK: - Lyfecycle and constructors

    override init() {
        super.init()
        validateWeight()
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

// MARK: - Variables

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
