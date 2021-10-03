//
//  SettingsView.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import SnapKit
import UIKit

class SettingsView: UIView {

    // MARK: - Constants

    private let kPickerHeight: CGFloat = 100

    // MARK: - Subviews

    lazy var contentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [darkModeRowStackView, divider, unitsTextLabel, unitsPicker])
        view.axis = .vertical
        view.spacing = DesignSystem.Margin.standard
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var darkModeRowStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [darkModeTextLabel, darkModeToggle])
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var darkModeTextLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Dark mode"
        view.textColor = DesignSystem.Colors.textStrong

        return view
    }()

    lazy var darkModeToggle: UISwitch = {
        let view = UISwitch()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.onTintColor = DesignSystem.Colors.primary

        return view
    }()

    lazy var unitsTextLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Unit used"
        view.textColor = DesignSystem.Colors.textStrong

        return view
    }()

    lazy var unitsPicker: UIPickerView = {
        let view = UIPickerView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Colors.backgroundAlpha
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

// MARK: - ViewCode

extension SettingsView: ViewCode {
    func buildViewHierarchy() {
        addSubviews([contentStackView])
    }

    func setupConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(DesignSystem.Margin.standard)
            make.right.equalToSuperview().offset(-DesignSystem.Margin.standard)
        }

        unitsPicker.snp.makeConstraints { make in
            make.height.equalTo(kPickerHeight)
        }

        divider.snp.makeConstraints { make in
            make.height.equalTo(DesignSystem.Height.smallDivider)
        }
    }

    func setupAdditionalConfiguration() {
        backgroundColor = DesignSystem.Colors.background
    }
}

