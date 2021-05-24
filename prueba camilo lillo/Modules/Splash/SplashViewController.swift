//
//  SplashViewController.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import UIKit

class SplashViewController: UIViewController {
    var presenter: SplashPresenterProtocol?
}

//MARK:- LifeCycle
extension SplashViewController {
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        presenter?.onViewDidAppear()
    }
}

//MARK:- View Protocol
extension SplashViewController: SplashViewProtocol {}
