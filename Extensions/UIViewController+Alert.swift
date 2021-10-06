//
//  UIViewController+Alert.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String = "Attention", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
