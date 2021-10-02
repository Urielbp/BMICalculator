//
//  UIViewController+HideKeyboard.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 02/10/21.
//

import UIKit

class KeyboardConfiguration: NSObject {
    let height: CGFloat?
    let animationDuration: Double?

    init(height: CGFloat?, animationDuration: Double?) {
        self.height = height
        self.animationDuration = animationDuration
    }
}

extension UIViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func keyboardWillAppear(notification: NSNotification) -> KeyboardConfiguration {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        let animationDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue

        return KeyboardConfiguration(height: keyboardHeight, animationDuration: animationDuration)
    }

    @objc func keyboardWillDisappear(notification: NSNotification) -> KeyboardConfiguration {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        let animationDuration = (notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        return KeyboardConfiguration(height: keyboardHeight, animationDuration: animationDuration)
    }

    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillAppear(notification:)),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillDisappear(notification:)),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
