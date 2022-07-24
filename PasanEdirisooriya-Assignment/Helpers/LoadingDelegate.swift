//
//  LoadingDelegate.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-22.
//

import Foundation
import RappleProgressHUD

protocol LoadingIndicatorDelegate {
    func startLoading()
    func stopLoading()
}

extension LoadingIndicatorDelegate {
    
    // Start loading
    func startLoading() {
        RappleActivityIndicatorView.startAnimating()
    }
     
    // Stop loading
    func stopLoading() {
        RappleActivityIndicatorView.stopAnimation()
    }
     
}
