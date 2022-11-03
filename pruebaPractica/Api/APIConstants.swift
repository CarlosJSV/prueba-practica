//
//  APIConstants.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import Foundation

class APIConstants {
   
    public static let isDebug : Bool = true
    
    private static let devBaseURL : String = "https://s3.amazonaws.com/"
    private static let prodBaseURL : String = ""
    
    public static func getBaseURL() -> String{
        
        return isDebug ? devBaseURL : prodBaseURL
        
    }

}
