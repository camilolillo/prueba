//
//  SessionDataManager.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation

struct LoginParameters {
    var rut: String
}

protocol SessionManagerProtocol: AnyObject {
    func checkSession() -> Bool
    func login(parameters: LoginParameters)
    func logout()
}

protocol LoginOutput: AnyObject {
    func onLoginSuccess()
    func onLoginFailure(with message: String)
}

protocol LogoutOutput: AnyObject {
    func onLogout()
}

class SessionManager: SessionManagerProtocol {
    
    var loginOutput: LoginOutput?
    var logoutOutput: LogoutOutput?
    
    func checkSession() -> Bool {
        if UserDefaults.standard.string(forKey: "rut") != nil {
            return true
        } else {
            return false
        }
    }
    func login(parameters: LoginParameters) {
        
        //Esta validación debería hacerla un interactor o el presenter en este caso, pero para simular mejor el flujo de login, decidí por ahora, validarlo a este nivel.
        
        guard parameters.rut.isRut() else {
            loginOutput?.onLoginFailure(with: "Por favor, ingresa un rut válido")
            return
        }
        UserDefaults.standard.setValue(parameters.rut, forKey: "rut")
        loginOutput?.onLoginSuccess()
    }
    func logout() {
        UserDefaults.standard.removeObject(forKey: "rut")
        logoutOutput?.onLogout()
    }
}
