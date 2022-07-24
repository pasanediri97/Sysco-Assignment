//
//  Localizator.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-23.
//

import Foundation
import UIKit

public class Localizator {
    fileprivate func NSLocalizedString(_ key: String) -> String {
        return Foundation.NSLocalizedString(key, comment: "")
    }
}

extension String {
    
    static let Success = NSLocalizedString("Success", comment: "")
    static let ErrorCorrupted = NSLocalizedString("Error is corrupted.", comment: "")
    static let InternetConnectionOffline = NSLocalizedString("Internet connection appears to be offline. ", comment: "")
    static let Error = NSLocalizedString("Error", comment: "")
    static let Dismiss = NSLocalizedString("Dismiss", comment: "")
}

