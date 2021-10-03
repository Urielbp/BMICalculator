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
    private var bag = Set<AnyCancellable>()

    // MARK: - Lyfecycle and constructors

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupTargets()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.forceUpdate()
        userInterfaceStyleDidChange(viewModel.darkMode)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        viewModel.darkMode ? .darkContent : .lightContent
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

    private func setupTargets() {
        customView.bodyMassCalculatorButton.addTarget(self, action: #selector(didTouchCalculationButton), for: .touchUpInside)
        customView.settingsButton.addTarget(self, action: #selector(didTouchSettingsButton), for: .touchUpInside)
    }

    private func userInterfaceStyleDidChange(_ darkModeEnabled: Bool) {
        overrideUserInterfaceStyle = darkModeEnabled ? .dark : .light
        setNeedsStatusBarAppearanceUpdate()
    }

    @objc private func didToggleDarkMode(_ sender: UISwitch) {
        viewModel.darkMode = sender.isOn
    }

    @objc private func didTouchCalculationButton(_ sender: UIButton) {
        let vc = HeightInputViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func didTouchSettingsButton(_ sender: UIButton) {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
