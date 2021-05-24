//
//  AppDelegate.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setMainVC()
        return true
    }


}

//MARK:- Methods
extension AppDelegate {
    func setMainVC() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let splashVC = SplashRouter.createModule()
        let navigationController = UINavigationController(rootViewController: splashVC)
        navigationController.navigationBar.isHidden = true
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
    }
}

