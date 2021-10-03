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

    lazy var bodyMassCalculatorButton: MyButton = {
        let view = MyButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Calculate Body Mass Index", for: .normal)

        return view
    }()

    lazy var settingsButton: MyButton = {
        let view = MyButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Settings", for: .normal)

        return view
    }()

    lazy var contentStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [bodyMassCalculatorButton, settingsButton])
        view.axis = .vertical
        view.spacing = DesignSystem.Margin.small
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

extension HomeView: ViewCode {
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
    }

    func setupAdditionalConfiguration() {
        backgroundColor = DesignSystem.Colors.background
    }
}
