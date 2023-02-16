//
//  AppDelegate.swift
//  CleanSwift
//
//  Created by Григоренко Александр Игоревич on 16.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var navController = UINavigationController()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewController = SpaceImageScreenBuilder.build()
        navController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        guard
            let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
            let host = components.host else {
            return false
        }
        guard
            let deepLink = DeepLink(rawValue: host)
        else { return false }

        let viewController = SpaceImageScreenBuilder.build()
        viewController.handleDeepLink(link: deepLink)
        return true
    }
}

