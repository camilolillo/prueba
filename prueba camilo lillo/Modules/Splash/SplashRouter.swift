//
//  SplashRouter.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation
import UIKit

class SplashRouter: SplashRouterProtocol {
    var viewController: UIViewController?
    
    static func createModule() -> SplashViewController {
        
        let view = SplashViewController.storyboardViewController()
        let presenter = SplashPresenter()
        let router = SplashRouter()
        
        let sessionManager = SessionManager()
        
        presenter.view = view
        presenter.router = router
        
        presenter.sessionManager = sessionManager
        
        view.presenter = presenter
        
        router.viewController = view
        
        return view
    }
    
    func presentMainVC() {
        let mainVC = MainRouter.createModule()
        viewController?.navigationController?.pushViewController(mainVC, animated: true)
    }
    func presentLoginVC() {
        let loginVC = LoginRouter.createModule()
        viewController?.navigationController?.pushViewController(loginVC, animated: true)
    }
}
