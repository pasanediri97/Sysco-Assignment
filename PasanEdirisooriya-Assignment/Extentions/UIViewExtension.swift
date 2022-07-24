//
//  UIViewExtension.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-23.
//

import Foundation
import UIKit

extension UIView {
    func setRoundBorders(_ cornerRadius: CGFloat = 10.0) {
      clipsToBounds = true
      layer.cornerRadius = cornerRadius
    }
}
