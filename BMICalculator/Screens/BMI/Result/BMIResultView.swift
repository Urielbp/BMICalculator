//
//  BMIResultView.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 03/10/21.
//

import Foundation
import UIKit

class BMIResultView: UIView {

    // MARK: - Subviews

    lazy var titleTextLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = DesignSystem.Colors.textStrong
        view.font = DesignSystem.Fonts.titleText
        view.numberOfLines = 0
        view.textAlignment = .center

        return view
    }()

    lazy var descriptionTextLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = DesignSystem.Colors.textStrong
        view.font = DesignSystem.Fonts.headerText

        return view
    }()

    lazy var contentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleTextLabel, descriptionTextLabel])
        view.axis = .vertical
        view.alignment = .center
        view.spacing = DesignSystem.Margin.small
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var continueButton: MyButton = {
        let view = MyButton()
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

extension BMIResultView: ViewCode {
    func buildViewHierarchy() {
        addSubviews([contentStackView, continueButton])
    }

    func setupConstraints() {

        contentStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(DesignSystem.Margin.standard)
            make.right.equalToSuperview().offset(-DesignSystem.Margin.standard)
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

