//
//  UserDefaultsImplementation.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 29/09/21.
//

import Foundation

class UserDefaultsImplementation: UserDefaultsProviderProtocol {

    static let defaults = UserDefaults.standard

    static func get(bool key: UserDefaultsBoolOptions) -> Bool {
        return defaults.bool(forKey: key.rawValue)
    }

    static func set(bool key: UserDefaultsBoolOptions, newValue: Bool) {
        defaults.set(newValue, forKey: key.rawValue)
    }
}
