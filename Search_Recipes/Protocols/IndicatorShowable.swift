//
//  IndicatorShowable.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

import MBProgressHUD

protocol IndicatorShowable: class {
  func showLoadingIndicator()
  func hideLoadingIndicator()
}

extension IndicatorShowable where Self: UIViewController {
  
  func showLoadingIndicator() {
    let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
    indicator.mode = .indeterminate
    indicator.show(animated: true)
  }
  
  func hideLoadingIndicator() {
    MBProgressHUD.hide(for: self.view, animated: true)
  }
}
