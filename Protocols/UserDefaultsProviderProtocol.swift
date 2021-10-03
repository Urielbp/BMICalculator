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

    static func get(string key: UserDefaultsStringOptions) -> String?
    static func set(string key: UserDefaultsStringOptions, newValue: String?)

    static func get(int key: UserDefaultsIntOptions) -> Int?
    static func set(int key: UserDefaultsIntOptions, newValue: Int?)
}

enum UserDefaultsBoolOptions: String {
    case darkModeEnabled
}

enum UserDefaultsStringOptions: String {
    case weightUnit
    case heightUnit
}

enum UserDefaultsIntOptions: String {
    case unitsIndex
}
