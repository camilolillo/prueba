//
//  SplashPresenter.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation

class SplashPresenter: SplashPresenterProtocol {
    
    var view: SplashViewProtocol?
    var router: SplashRouterProtocol?
    
    var sessionManager: SessionManagerProtocol?

    func onViewDidAppear() {
        
        if sessionManager?.checkSession() ?? false {
            router?.presentMainVC()
        } else {
            router?.presentLoginVC()
        }
        
    }
}
