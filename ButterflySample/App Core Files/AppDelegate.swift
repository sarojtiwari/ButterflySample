//
//  AppDelegate.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 09/03/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = UINavigationController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        coordinator = MainCoordinator(controller)
        coordinator?.start()
        return true
    }


}

