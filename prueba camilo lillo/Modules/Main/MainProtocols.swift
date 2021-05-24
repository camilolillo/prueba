//
//  MainProtocols.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func set(data: [Local])
}

protocol MainPresenterProtocol: AnyObject {
    func onViewDidLoad()
    func onBackButtonPressed()
}

protocol MainRouterProtocol: AnyObject {
    static func createModule() -> MainViewController
    func dismiss()
    func presentDetail(local: Local)
    func displayAlert(message: String)
}
