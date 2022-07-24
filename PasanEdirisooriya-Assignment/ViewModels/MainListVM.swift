//
//  MainListVM.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-22.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

class MainListVM:NSObject{
    
    var planets:[Planet] = []
    var planetList = BehaviorRelay<[Planet]>(value: [])
    var currentPage = 1
    
    func fetchPlanets(isLoadMore:Bool, page:Int, completion:  @escaping CompletionHandlerWithData) {
        let parameters:Parameters = ["page":page]
        
        //MARK: Fail if internet is not available
        guard Reachability.isInternetAvailable() else {
            completion(false, 503, .InternetConnectionOffline, nil)
            return
        }
        
        //MARK: Call api via service class
        APIClient.getPlanetsData(parameters: parameters ,completion:{(result) in
            switch(result){
                
            case .success(let planetsData):
                if planetsData.results != nil {
                    
                    self.planets.append(contentsOf: planetsData.results ?? [])
                    self.planetList.accept(self.planets)
                    
                    completion(true, 200, .Success, planetsData)
                }else{
                    completion(false, 500, .ErrorCorrupted, nil)
                }
                
            case .failure(let error):
                completion(false, 500, error.localizedDescription, nil)
            }
        })
        
    }
}
