//
//  AlertProvider.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-23.
//

import Foundation

import UIKit

class AlertProvider {
    
    var _vc: UIViewController?
    var _tvc: UIViewController?
    
    init(vc: UIViewController) {
        self._vc = vc
        self._tvc = nil
    }
    
    init(tvc: UITableViewController) {
        self._vc = nil
        self._tvc = tvc
    }
    
    func showAlert(title: String?, message: String, action: AlertAction) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: action.title, style: action.style, handler: nil))
        
        if _vc != nil {
            _vc?.present(alertController, animated: true, completion: nil)
        } else {
            _tvc?.present(alertController, animated: true, completion: nil)
        }
    }
}

struct AlertAction {
    var title: String?
    var style: UIAlertAction.Style
    
    init(title: String, style: UIAlertAction.Style = .default) {
        self.title = title
        self.style = style
    }
}
