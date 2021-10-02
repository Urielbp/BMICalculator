//
//  BaseViewModel.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 02/10/21.
//

import Foundation

class BaseViewModel {

    // MARK: - Bindable variables

    @Published var darkMode: Bool {
        didSet {
            UserDefaultsImplementation.set(bool: .darkModeEnabled, newValue: darkMode)
        }
    }

    // MARK: - Lyfecycle and constructors

    init() {
        darkMode = UserDefaultsImplementation.get(bool: .darkModeEnabled)
    }

}
