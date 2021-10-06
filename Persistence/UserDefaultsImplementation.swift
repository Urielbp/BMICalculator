//
//  UserDefaultsImplementation.swift
//  BMICalculator
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

    static func get(string key: UserDefaultsStringOptions) -> String? {
        defaults.string(forKey: key.rawValue)
    }

    static func set(string key: UserDefaultsStringOptions, newValue: String?) {
        defaults.setValue(newValue, forKey: key.rawValue)
    }

    static func get(int key: UserDefaultsIntOptions) -> Int? {
        defaults.integer(forKey: key.rawValue)
    }

    static func set(int key: UserDefaultsIntOptions, newValue: Int?) {
        defaults.setValue(newValue, forKey: key.rawValue)
    }
}
