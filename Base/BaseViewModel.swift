//
//  BaseViewModel.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 02/10/21.
//

import Foundation

protocol DarkModeViewModelProtocol: AnyObject {
    var darkMode: Bool { get set }

    func forceUpdate()
}

class BaseViewModel: DarkModeViewModelProtocol {

    // MARK: - Bindable variables

    var darkMode: Bool = UserDefaultsImplementation.get(bool: .darkModeEnabled) {
        didSet {
            UserDefaultsImplementation.set(bool: .darkModeEnabled, newValue: darkMode)
        }
    }

    func forceUpdate() {
        darkMode = UserDefaultsImplementation.get(bool: .darkModeEnabled)
    }
}
