//
//  APIRouter.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-22.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{
    case getPlanetsData(parameters:Parameters)
    
    var method:HTTPMethod{
        switch self {
        case .getPlanetsData:
            return .get
        }
    }
    
    var path:String{
        switch self {
        case .getPlanetsData:
            return "planets"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = ""
        
        url = Constants.BASE_URL
        
        
        let baseURL = try url.asURL()
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        
        print(urlRequest)
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        
        switch self {
            
        case .getPlanetsData(let parameters):
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}


