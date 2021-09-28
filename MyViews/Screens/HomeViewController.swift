//
//  HomeViewController.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 28/09/21.
//

import UIKit

class HomeViewController: LoadableViewController<HomeView> {

//    override func viewDidLoad() {
//        customView.setupView()
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}
