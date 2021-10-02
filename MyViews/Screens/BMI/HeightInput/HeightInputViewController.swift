//
//  HeightInputViewController.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 30/09/21.
//

import Combine
import UIKit

class HeightInputViewController: LoadableViewController<HeightInputView> {

    // MARK: - Variables

    private lazy var viewModel = HeightInputViewModel()
    private var bag = Set<AnyCancellable>()

    // MARK: - Lyfecycle and constructors

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
//        setupTargets()
        setupToHideKeyboardOnTapOnView()
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
//        customView.darkModeToggle.isOn = darkModeEnabled
    }
}
