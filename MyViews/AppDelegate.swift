//
//  AppDelegate.swift
//  MyViews
//
//  Created by Uriel Barbosa Pinheiro on 28/09/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Stored properties

    private lazy var mainWindow = UIWindow()
    private let router = AppCoordinator().strongRouter

    // MARK: UIApplicationDelegate

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        router.setRoot(for: mainWindow)
        return true
    }
}
