//
//  HomeViewModel.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 29/09/21.
//

import Foundation
import UIKit

class HomeViewModel {

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
