//
//  RecipeView.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

import Foundation
protocol RecipeView: AlertShowable, Presentable {
    func show(recipe: Recipe)
}
