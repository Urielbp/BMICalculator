//
//  UIViewController+NavigationButtons.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 05/10/21.
//

import UIKit

extension UIViewController {
    func setupBackButton() {
        navigationController?.navigationBar.topItem?.title = ""
    }

    func hideBackButton() {
        navigationItem.hidesBackButton = true
    }

    func setupCloseButton() {
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapCloseButton))
        navigationItem.setRightBarButton(closeButton, animated: false)
    }

    @objc func didTapCloseButton() {
        
    }
}
