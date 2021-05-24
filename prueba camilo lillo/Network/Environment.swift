//
//  Environment.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation

enum Environment {
    
    private static var baseURLAsString: String = "https://farmanet.minsal.cl/index.php/ws"
    
    static var baseURL: URL? { URL(string: baseURLAsString) }
    
}
