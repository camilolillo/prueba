//
//  LoginViewController.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterProtocol?

    @IBOutlet weak var rutField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.addTarget(
                self,
                action: #selector(onLoginButtonPressed(sender:)),
                for: .touchUpInside)
        }
    }
}
extension LoginViewController {
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
}
//MARK:- Targets
extension LoginViewController {
    @objc func onLoginButtonPressed(sender: UIButton) {
        presenter?.onLoginButtonPressed(rut: rutField.text)
    }
}
//MARK:- View protocol
extension LoginViewController: LoginViewProtocol { }
