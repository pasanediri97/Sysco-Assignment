//
//  APIClient.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-22.
//

import Foundation
import Alamofire

class APIClient{
    
    static func getPlanetsData(parameters : Parameters, completion:@escaping (AFResult<GetPlanetsListResponse>)->Void){
        AF.request(APIRouter.getPlanetsData(parameters:parameters)).responseDecodable{
            (response:AFDataResponse<GetPlanetsListResponse>) in completion(response.result)
            
        }
    }
}
