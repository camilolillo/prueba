//
//  LocalsDataManager.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation

protocol LocalesDataManagerProtocol: AnyObject {
    func getLocales()
}

protocol GetLocalesOutput: AnyObject {
    func onGetLocalesSuccess(with response: [Local])
    func onGetLocalesFailure()
}

class LocalesDataManager: LocalesDataManagerProtocol {
    var localesManagerOutput: GetLocalesOutput?
    
    func getLocales() {
        API.call(
            resource: APIRouter.getLocales,
            onSuccess: {
                (response: [Local]) in
                self.localesManagerOutput?.onGetLocalesSuccess(with: response)
            }, onFailure: {
                self.localesManagerOutput?.onGetLocalesFailure()
            }
        )
    }
}
