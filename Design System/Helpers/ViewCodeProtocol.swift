//
//  ViewCodeProtocol.swift
//  BMICalculator
//
//  Created by Uriel Barbosa Pinheiro on 28/09/21.
//

import Foundation

protocol ViewCode {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    func buildViewHierarchy() { }

    func setupConstraints() { }

    func setupAdditionalConfiguration() { }
}
