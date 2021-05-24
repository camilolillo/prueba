//
//  LoginPresenter.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    var view: LoginViewProtocol?
    var router: LoginRouterProtocol?
    
    var sessionManager: SessionManagerProtocol?
    
    func onLoginButtonPressed(rut: String?) {
        guard let rut = rut else {
            return
        }
        sessionManager?.login(parameters: LoginParameters(rut: rut))
    }
}

extension LoginPresenter: LoginOutput {
    func onLoginSuccess() {
        router?.dismisss()
    }
    func onLoginFailure(with message: String) {
        router?.displayAlert(message: message)
    }
}
