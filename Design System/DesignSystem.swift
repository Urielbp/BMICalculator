//
//  DesignSystem.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 28/09/21.
//

import Foundation
import UIKit

final class DesignSystem {

    struct CornerRadius {
        static let button: CGFloat = 4
    }

    struct Height {
        static let buttonHeight: CGFloat = 48
    }

    struct Padding {
        static let button: CGFloat = 4
    }

    struct Margin {
        static let big: CGFloat = 36
        static let standard: CGFloat = 24
        static let small: CGFloat = 16
    }

    struct BorderWidth {
        static let standard: CGFloat = 2
    }

    struct FontSizes {
        static let title: CGFloat = 56
        static let header: CGFloat = 28
        static let text: CGFloat = 14
        static let button: CGFloat = 18
    }

    struct Fonts {
        static let titleText: UIFont = UIFont.boldSystemFont(ofSize: FontSizes.title)
        static let headerText: UIFont = UIFont.boldSystemFont(ofSize: FontSizes.header)
        static let strongText: UIFont = UIFont.boldSystemFont(ofSize: FontSizes.text)
        static let boldButton: UIFont = UIFont.boldSystemFont(ofSize: FontSizes.button)
    }

    struct Colors {
        static let primary = UIColor(named: "Primary Color")
        static let textStrong = UIColor(named: "Text Strong")
        static let background = UIColor(named: "Background Color")
        static let black = UIColor.black
        static let white = UIColor.white
        static let clear = UIColor.clear
    }
}
