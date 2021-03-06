//
//  SettingsViewModel.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Foundation

enum HeightUnit: String, CaseIterable {
    case meters
    case inches
}

enum WeightUnit: String, CaseIterable {
    case kilos
    case pounds
}

protocol SettingsViewModelProtocol: DarkModeViewModelProtocol {
    var unitsPickerOptions: [String] { get }
    var selectedPickerIndex: Int { get set }
}

class SettingsViewModel: BaseViewModel {

    // MARK: - Constants

    private let kUnitsSeparator: String = "/"

    // MARK: - Variables

    var unitsPickerOptions: [String] {
        let heightUnits = HeightUnit.allCases.map({ $0.rawValue.localized })
        let weightUnits = WeightUnit.allCases.map({ $0.rawValue.localized })
        return zip(heightUnits, weightUnits).map({ "\($0)\(kUnitsSeparator)\($1)" })
    }

    var selectedPickerIndex: Int = UserDefaultsImplementation.get(int: .unitsIndex) ?? 0 {
        didSet {
            let selectedUnits = unitsPickerOptions[selectedPickerIndex].components(separatedBy: kUnitsSeparator)
            let selectedHeight = selectedUnits[safe: 0]
            let selectedWeight = selectedUnits[safe: 1]
            UserDefaultsImplementation.set(string: .heightUnit, newValue: selectedHeight)
            UserDefaultsImplementation.set(string: .weightUnit, newValue: selectedWeight)
            UserDefaultsImplementation.set(int: .unitsIndex, newValue: selectedPickerIndex)
        }
    }
}

extension SettingsViewModel: SettingsViewModelProtocol { }
