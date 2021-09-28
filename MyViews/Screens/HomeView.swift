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

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Banana"
        label.textColor = .black

        return label
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
        addSubview(label)
    }

    func setupConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
