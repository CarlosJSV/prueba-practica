//
//  APIRequest.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import Foundation
import Alamofire

class APIRequest {
    
    enum HTTPErrors: Error {
        case decodingError(description: String)
    }
    
    static func requestGet<T: Decodable>(url: String,
                                         completion: @escaping (Result<T, APIRequest.HTTPErrors>) -> Void) {

        AF.request(url, method: .get).responseDecodable{ (response: DataResponse <T, AFError>) in
            debugPrint(response)
            if let error = response.error {
                completion(.failure(.decodingError(description: "API error: \(String(describing: error))")))
                return
            }
            
            if let data = response.value {
                completion(.success(data))
                return
            }
            
            completion(.failure(.decodingError(description: "Data invalid")))
        }
        
    }
    
}
