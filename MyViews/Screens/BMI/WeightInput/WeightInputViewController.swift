//
//  WeightInputViewController.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Combine
import UIKit

class WeightInputViewController: LoadableViewController<GenericInputView> {

    // MARK: - Variables

    private lazy var viewModel = WeightInputViewModel()
    private var bag = Set<AnyCancellable>()

    // TODO: Refactor to use coordinators
    var height: Float?

    // MARK: - Lyfecycle and constructors

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
        setupTargets()
        setupDelegates()
        registerKeyboardNotifications()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userInterfaceStyleDidChange(viewModel.darkMode)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        viewModel.darkMode ? .darkContent : .lightContent
    }

    @objc override func keyboardWillAppear(notification: NSNotification) -> KeyboardConfiguration {
        let keyboardConfiguration = super.keyboardWillAppear(notification: notification)
        guard let keyboardHeight = keyboardConfiguration.height,
              let animationDuration = keyboardConfiguration.animationDuration else { return keyboardConfiguration }
        customView.setupViewForKeyboard(show: true, height: keyboardHeight, animationDuration: animationDuration)
        return keyboardConfiguration
    }

    @objc override func keyboardWillDisappear(notification: NSNotification)  -> KeyboardConfiguration {
        let keyboardConfiguration = super.keyboardWillDisappear(notification: notification)
        guard let keyboardHeight = keyboardConfiguration.height,
              let animationDuration = keyboardConfiguration.animationDuration else { return keyboardConfiguration }
        customView.setupViewForKeyboard(show: false, height: keyboardHeight, animationDuration: animationDuration)
        return keyboardConfiguration
    }

    // MARK: - Private functions

    private func setupView() {
        customView.titleTextLabel.text = "Insert your weight"
        customView.descriptionTextLabel.text = "in \(viewModel.weightUnit)"
    }

    private func setupBindings() {
        viewModel.$darkMode
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] darkMode in
                guard let self = self else { return }
                self.userInterfaceStyleDidChange(darkMode)
            })
            .store(in: &bag)
    }

    private func userInterfaceStyleDidChange(_ darkModeEnabled: Bool) {
        overrideUserInterfaceStyle = darkModeEnabled ? .dark : .light
        setNeedsStatusBarAppearanceUpdate()
    }

    private func setupTargets() {
        customView.continueButton.addTarget(self, action: #selector(didTouchContinueButton), for: .touchUpInside)
    }

    private func setupDelegates() {
        customView.heightTextField.delegate = self
    }

    @objc private func didTouchContinueButton(_ sender: UIButton) {
        if let error = viewModel.errorMessage {
            presentAlert(message: error)
        } else {
            customView.heightTextField.endEditing(true)
            let vc = BMIResultViewController()
            vc.height = height
            vc.weight = viewModel.weight
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - UITextViewDelegate

extension WeightInputViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        viewModel.weight = Float(text)
    }
}
