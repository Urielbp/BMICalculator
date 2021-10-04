//
//  BMIResultViewController.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Combine
import UIKit

class BMIResultViewController: LoadableViewController<BMIResultView> {
    // MARK: - Variables

    private var viewModel: BMIResultViewModel
    private var bag = Set<AnyCancellable>()

    // MARK: - Lyfecycle and constructors

    required init?(coder aDecoder: NSCoder) {
          fatalError()
      }

    init(viewModel: BMIResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
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

    // MARK: - Private functions

    private func setupView() {
        customView.titleTextLabel.text = "Your Body Mass Index is"
        customView.descriptionTextLabel.text = viewModel.bmi
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

    @objc private func didTouchContinueButton(_ sender: UIButton) {
        viewModel.finishFlow()
    }
}
