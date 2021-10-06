//
//  UITextField+Padding.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 30/09/21.
//

import Foundation
import UIKit

extension UITextField {

    // Source: https://www.ti-enxame.com/pt/ios/criar-espaco-no-inicio-de-um-uitextfield/1047975646/
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
