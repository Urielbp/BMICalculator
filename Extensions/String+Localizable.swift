//
//  String+Localizable.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 05/10/21.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    func localized(_ args: CVarArg...) -> String {
        withVaList(args, { NSString(format: self.localized, arguments: $0) as String })
    }
}
