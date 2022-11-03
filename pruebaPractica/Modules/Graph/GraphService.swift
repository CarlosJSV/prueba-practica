//
//  GraphRemoteDataManager.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation

class GraphService:GraphServiceInputProtocol {
    
    func getReport(completion: @escaping(_ response: Result<Report, APIRequest.HTTPErrors>) -> Void) {
        let url = "\(APIConstants.getBaseURL())dev.reports.files/test.json"
        APIRequest.requestGet(url: url, completion: completion)
        }

}
