//
//  MainPresenter.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    var view: MainViewProtocol?
    var router: MainRouterProtocol?
    
    var localesDataManager: LocalesDataManagerProtocol?
    var sessionManager: SessionManagerProtocol?
    
    func onViewDidLoad() {
        localesDataManager?.getLocales()
    }
    func onBackButtonPressed() {
        sessionManager?.logout()
    }
}

extension MainPresenter: GetLocalesOutput {
    func onGetLocalesSuccess(with response: [Local]) {
        view?.set(data: response)
    }
    func onGetLocalesFailure() {
        router?.displayAlert(message: "Hubo un problema con la solicitud")
    }
}

extension MainPresenter: LogoutOutput {
    func onLogout() {
        router?.dismiss()
    }
}
