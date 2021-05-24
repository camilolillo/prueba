//
//  API.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Alamofire

// MARK: - API
enum API {}

extension API {
    @discardableResult static func call<T: Decodable>(resource: URLRequestConvertible, onResponse: CompletionHandler = nil, onSuccess: SuccessHandler<T> = nil, onFailure: CompletionHandler = nil) -> DataRequest {
        var jsonDecoder: JSONDecoder {
            let jsonDecoder = JSONDecoder()
            return jsonDecoder
        }

        return AF
            .request(resource)
            .validate()
            .responseDecodable(decoder: jsonDecoder) {
                (response: AFDataResponse<T>) in

                print("\nAPI.call() Response: \(response)")

                onResponse?()

                switch response.result {
                case .success(let decodedObject):
                    onSuccess?(decodedObject)
                case .failure(let error):
                    print("error.localizedDescription: \(error.localizedDescription)")
                    onFailure?()
                }
            }
    }
}
