//
//  Presentable.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

import UIKit

protocol Presentable {
  func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
  
  func toPresent() -> UIViewController? {
    return self
  }
}
