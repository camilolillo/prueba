//
//  LoginRouter.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
    var viewController: UIViewController?
    static func createModule() -> LoginViewController {
        
        let view = LoginViewController.storyboardViewController()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        let sessionManager = SessionManager()
        sessionManager.loginOutput = presenter
        
        presenter.sessionManager = sessionManager
        
        router.viewController = view
        
        presenter.view = view
        presenter.router = router
        
        view.presenter = presenter
        
        return view
        
    }
    func dismisss() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    func displayAlert(message: String) {
        viewController?.displayOneButtonAlert(title: "ERROR", message: message)
    }
}
