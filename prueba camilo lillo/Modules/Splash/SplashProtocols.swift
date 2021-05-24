//
//  SplashProtocols.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation

protocol SplashViewProtocol: AnyObject { }

protocol SplashPresenterProtocol: AnyObject {
    func onViewDidAppear()
}

protocol SplashRouterProtocol: AnyObject {
    static func createModule() -> SplashViewController
    func presentMainVC()
    func presentLoginVC()
}
