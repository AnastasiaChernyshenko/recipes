//
//  Extensions.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//
import Foundation
import UIKit

extension String{
    func urlEncode() -> String{
        return self.replacingOccurrences(of: " ", with: "%20")
    }
}

extension UIView {
        func dropShadow() {
            layer.shadowOpacity = 0.5
            layer.shadowOffset = CGSize(width: 2, height: 2)
            layer.shadowRadius = 3.0
            layer.shadowColor = UIColor.black.cgColor
            layer.masksToBounds = false
        }
}
