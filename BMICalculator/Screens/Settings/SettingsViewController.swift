//
//  SettingsViewController.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import UIKit

class SettingsViewController: LoadableViewController<SettingsView> {

    // MARK: - Variables

    private var viewModel: SettingsViewModelProtocol
    
    // MARK: - Lyfecycle and constructors

    required init?(coder aDecoder: NSCoder) {
          fatalError()
      }

    init(viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
        setupDelegates()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userInterfaceStyleDidChange(viewModel.darkMode)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        viewModel.darkMode ? .darkContent : .lightContent
    }

    // MARK: - Private functions

    private func setupTargets() {
        customView.darkModeToggle.addTarget(self, action: #selector(didToggleDarkMode), for: .valueChanged)
    }

    private func setupDelegates() {
        customView.unitsPicker.delegate = self
        customView.unitsPicker.dataSource = self
    }

    private func setupView() {
        customView.darkModeTextLabel.text = "settings.dark.mode.toggle".localized
        customView.unitsTextLabel.text = "settings.units.picker".localized
        customView.unitsPicker.selectRow(viewModel.selectedPickerIndex, inComponent: 0, animated: true)
        setupBackButton()
    }

    private func userInterfaceStyleDidChange(_ darkModeEnabled: Bool) {
        overrideUserInterfaceStyle = darkModeEnabled ? .dark : .light
        setNeedsStatusBarAppearanceUpdate()
        customView.darkModeToggle.isOn = darkModeEnabled
    }

    @objc private func didToggleDarkMode(_ sender: UISwitch) {
        viewModel.darkMode = sender.isOn
        userInterfaceStyleDidChange(viewModel.darkMode)
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.unitsPickerOptions.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.unitsPickerOptions[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.selectedPickerIndex = row
    }
}
