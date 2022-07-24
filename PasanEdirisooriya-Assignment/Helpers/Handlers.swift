//
//  Handlers.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-22.
//

import Foundation
 
typealias CompletionHandler = (_ status: Bool, _ code: Int, _ message: String) -> ()
typealias CompletionHandlerWithData = (_ status: Bool, _ code: Int, _ message: String, _ data: Any?) -> ()

func delay(_ delay: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

