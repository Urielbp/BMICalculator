//
//  HomeViewController.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 28/09/21.
//

import Combine
import UIKit

class HomeViewController: LoadableViewController<HomeView> {

    // MARK: - Variables

    private lazy var viewModel = HomeViewModel()
    private var viewModelSubscriber: AnyCancellable?

    // MARK: - Lyfecycle and constructors

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupTargets()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userInterfaceStyleDidChange(viewModel.darkMode)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        viewModel.darkMode ? .darkContent : .lightContent
    }

    // MARK: - Private functions

    private func setupBindings() {
        viewModelSubscriber = viewModel.$darkMode.sink(receiveValue: userInterfaceStyleDidChange)
    }

    private func setupTargets() {
        customView.darkModeToggle.addTarget(self, action: #selector(didToggleDarkMode), for: .valueChanged)
    }

    private func userInterfaceStyleDidChange(_ darkModeEnabled: Bool) {
        overrideUserInterfaceStyle = darkModeEnabled ? .dark : .light
        setNeedsStatusBarAppearanceUpdate()
        customView.darkModeToggle.isOn = darkModeEnabled
    }

    @objc private func didToggleDarkMode(_ sender: UISwitch) {
        viewModel.darkMode = sender.isOn
    }
}
