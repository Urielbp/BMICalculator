//
//  BaseViewModel.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 02/10/21.
//

import Foundation

class BaseViewModel {

    // MARK: - Bindable variables

    @Published var darkMode: Bool = UserDefaultsImplementation.get(bool: .darkModeEnabled) {
        didSet {
            UserDefaultsImplementation.set(bool: .darkModeEnabled, newValue: darkMode)
        }
    }

    func forceUpdate() {
        darkMode = UserDefaultsImplementation.get(bool: .darkModeEnabled)
    }
}
