//
//  BMIResultViewController.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import UIKit

class BMIResultViewController: LoadableViewController<BMIResultView> {
    // MARK: - Variables

    private var viewModel: BMIResultViewModelProtocol

    // MARK: - Lyfecycle and constructors

    required init?(coder aDecoder: NSCoder) {
          fatalError()
      }

    init(viewModel: BMIResultViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTargets()
        registerKeyboardNotifications()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userInterfaceStyleDidChange(viewModel.darkMode)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        viewModel.darkMode ? .darkContent : .lightContent
    }

    override func didTapCloseButton() {
        viewModel.finishFlow()
    }

    // MARK: - Private functions

    private func setupView() {
        customView.titleTextLabel.text = "bmi.result.title".localized
        customView.descriptionTextLabel.text = viewModel.bmi
        customView.continueButton.setTitle("bmi.result.finish.button".localized, for: .normal)
        hideBackButton()
        setupCloseButton()
    }

    private func userInterfaceStyleDidChange(_ darkModeEnabled: Bool) {
        overrideUserInterfaceStyle = darkModeEnabled ? .dark : .light
        setNeedsStatusBarAppearanceUpdate()
    }

    private func setupTargets() {
        customView.continueButton.addTarget(self, action: #selector(didTouchContinueButton), for: .touchUpInside)
    }

    @objc private func didTouchContinueButton(_ sender: UIButton) {
        viewModel.finishFlow()
    }
}
