//
//  UserDefaultsProviderProtocol.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 29/09/21.
//

import Foundation

protocol UserDefaultsProviderProtocol {
    static func get(bool key: UserDefaultsBoolOptions) -> Bool
    static func set(bool key: UserDefaultsBoolOptions, newValue: Bool)
}

enum UserDefaultsBoolOptions: String {
    case darkModeEnabled
}
