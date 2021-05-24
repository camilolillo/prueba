//
//  LoginProtocols.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation
import UIKit

protocol LoginViewProtocol: AnyObject {
    
}

protocol LoginPresenterProtocol: AnyObject {
    func onLoginButtonPressed(rut: String?)
}

protocol LoginRouterProtocol: AnyObject {
    static func createModule() -> LoginViewController
    func dismisss()
    func displayAlert(message: String)
}
