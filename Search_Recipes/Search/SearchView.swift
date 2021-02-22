//
//  SearchView.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

import Foundation
protocol SearchView: AlertShowable, IndicatorShowable, Presentable {
    var selectedRecipe: ((Recipe) -> Void)? { get set }
    func showSearchResults(recipes: [SearchRecipe])
}
