//
//  MainRouter.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol {
    
    var viewController: UIViewController?
    
    static func createModule() -> MainViewController {
    
        let view = MainViewController.storyboardViewController()
        let presenter = MainPresenter()
        let router = MainRouter()
        
        let sessionManager = SessionManager()
        let localesManager = LocalesDataManager()
        
        sessionManager.logoutOutput = presenter
        localesManager.localesManagerOutput = presenter
        
        presenter.localesDataManager = localesManager
        
        presenter.sessionManager = sessionManager
        
        view.presenter = presenter
        
        presenter.view = view
        
        router.viewController = view
        
        presenter.router = router
        
        return view
    }
    
    func dismiss() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    func presentDetail(local: Local) {
        print(local)
    }
    func displayAlert(message: String) {
        viewController?.displayOneButtonAlert(title: "ERROR", message: message)
    }
}
