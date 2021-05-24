//
//  APIRouter.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case getLocales
    
    var baseURL: URL? { Environment.baseURL }
    
    var path: String {
        switch self {
            case .getLocales: return "/getLocales"
        }
    }
    
    var url: URL? { baseURL?.appendingPathComponent(path) }
    
    var method: HTTPMethod {
        switch self {
        case .getLocales: return .get
        default: return .post
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .getLocales: return [:]
        default:
            return [:]
        }
    }
    
    // MARK: - asURLRequest
    func asURLRequest() throws -> URLRequest {
        guard let url = url else { return URLRequest(url: URL(string: .empty)!) }
        
        var urlRequest = URLRequest(url: url)
        
        defer {
            print("urlRequest: \(urlRequest)")
            print("urlRequest.allHTTPHeaderFields: \(String(describing: urlRequest.allHTTPHeaderFields))")
            print("Parameters: \(parameters)")
        }
        
        // MARK: - HTTPMethod
        urlRequest.httpMethod = method.rawValue
        
        // MARK: - Headers
        switch self {
        case .getLocales:
            print("No Header")
        default: break
        }

        // MARK: - Parameters Encoding
        switch method {
        case .get: return try URLEncoding.default.encode(urlRequest, with: parameters)
        default: return try JSONEncoding.default.encode(urlRequest, with: parameters)
        }
    }
    
}
