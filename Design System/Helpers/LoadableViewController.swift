//
//  LoadableViewController.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 28/09/21.
//

import Foundation
import UIKit

// Source: https://movile.blog/escrevendo-view-code-mais-limpo-usando-loadview/

class LoadableViewController<CustomView: UIView>: UIViewController {
    var customView: CustomView {
        return view as! CustomView
    }

    override func loadView() {
        view = CustomView()
    }
}
