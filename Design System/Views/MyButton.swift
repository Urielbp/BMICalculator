//
//  MyButton.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 28/09/21.
//

import Foundation
import UIKit

class MyButton: UIButton {

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

extension MyButton: ViewCode {
    func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(DesignSystem.Height.buttonHeight)
        }
    }

    func setupAdditionalConfiguration() {
        backgroundColor = DesignSystem.Colors.primary
        setTitleColor(DesignSystem.Colors.background, for: .normal)
        layer.cornerRadius = DesignSystem.CornerRadius.button
        titleLabel?.font = DesignSystem.Fonts.boldButton
    }
}
