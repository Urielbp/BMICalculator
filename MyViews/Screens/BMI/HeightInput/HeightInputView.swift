//
//  HeightInputView.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 30/09/21.
//

import Foundation
import UIKit

class HeightInputView: UIView {
    
    // MARK: - Subviews

    lazy var titleTextLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Insert your height"
        view.textColor = DesignSystem.Colors.textStrong
        view.font = DesignSystem.Fonts.headerText

        return view
    }()

    lazy var heightTextField: UITextField = {
        let view = UITextField()
        view.layer.borderWidth = DesignSystem.BorderWidth.standard
        view.layer.borderColor = DesignSystem.Colors.textStrong?.cgColor
        view.layer.cornerRadius = DesignSystem.CornerRadius.button
        view.tintColor = DesignSystem.Colors.textStrong
        view.backgroundColor = DesignSystem.Colors.background
        view.setLeftPaddingPoints(DesignSystem.Margin.small)
        view.setRightPaddingPoints(DesignSystem.Margin.small)
        view.keyboardType = .decimalPad

        return view
    }()

    lazy var continueButton: MyButton = {
        let view = MyButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Continue", for: .normal)

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

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        heightTextField.layer.borderColor = DesignSystem.Colors.textStrong?.cgColor
        setNeedsDisplay()
    }

    // MARK: - Functions

    func setupViewForKeyboard(show: Bool, height: CGFloat, animationDuration: Double) {
        let contraintHeight = show ? height : DesignSystem.Margin.standard

        UIView.animate(withDuration: animationDuration) {
            self.continueButton.snp.updateConstraints { make in
                make.bottom.equalTo(self.snp.bottomMargin).offset(-contraintHeight)
            }
            self.layoutIfNeeded()
        }
    }
}

// MARK: - ViewCode

extension HeightInputView: ViewCode {
    func buildViewHierarchy() {
        addSubviews([titleTextLabel, heightTextField, continueButton])
    }

    func setupConstraints() {
        titleTextLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(DesignSystem.Margin.big)
            make.centerX.equalToSuperview()
        }

        heightTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextLabel.snp.bottom).offset(DesignSystem.Margin.small)
            make.leading.equalTo(self.snp.leading).offset(DesignSystem.Margin.standard)
            make.trailing.equalTo(self.snp.trailing).offset(-DesignSystem.Margin.standard)
            make.height.equalTo(DesignSystem.Height.buttonHeight)
        }

        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(DesignSystem.Margin.standard)
            make.right.equalToSuperview().offset(-DesignSystem.Margin.standard)
            make.bottom.equalTo(self.snp.bottomMargin).offset(-DesignSystem.Margin.standard)
        }
    }

    func setupAdditionalConfiguration() {
        backgroundColor = DesignSystem.Colors.background
    }
}
