//
//  Recipe.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

import Foundation

struct Recipe: Codable{
    let label: String
    let image: String?
    let ingredientLines: [String]
}

struct SearchRecipe: Codable{
    let recipe: Recipe
}

struct Recipes: Codable {
    let hits: [SearchRecipe]
}
