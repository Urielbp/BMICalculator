//
//  HomeView.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 28/09/21.
//

import SnapKit
import UIKit

class HomeView: UIView {

    // MARK: - Subviews

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

    lazy var bodyMassCalculatorButton: MyButton = {
        let view = MyButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Calculate Body Mass Index", for: .normal)

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

extension HomeView: ViewCode {
    func buildViewHierarchy() {
        addSubviews([darkModeTextLabel, darkModeToggle, bodyMassCalculatorButton])
    }

    func setupConstraints() {
        bodyMassCalculatorButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(DesignSystem.Margin.standard)
            make.right.equalToSuperview().offset(-DesignSystem.Margin.standard)
        }

        darkModeTextLabel.snp.makeConstraints { make in
            make.top.equalTo(darkModeToggle.snp.top)
            make.right.equalTo(darkModeToggle.snp.left).offset(-DesignSystem.Margin.small)
            make.centerY.equalTo(darkModeToggle.snp.centerY)
        }

        darkModeToggle.snp.makeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(DesignSystem.Margin.standard)
            make.right.equalTo(self.snp.right).offset(-DesignSystem.Margin.standard)
        }
    }

    func setupAdditionalConfiguration() {
        backgroundColor = DesignSystem.Colors.background
    }
}
