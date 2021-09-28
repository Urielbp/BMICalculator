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
        static let standard: CGFloat = 24
    }

    struct BorderWidth {
        static let standard: CGFloat = 2
    }

    struct FontSizes {
        static let header: CGFloat = 28
        static let text: CGFloat = 14
        static let button: CGFloat = 18
    }

    struct Colors {
        static let primary = UIColor(named: "Primary Color")
        static let secondary = UIColor(named: "Secondary Color")
        static let textStrong = UIColor(named: "Text Strong")
        static let backGround = UIColor.black
        static let black = UIColor.black
        static let white = UIColor.white
        static let clear = UIColor.clear
    }
}
