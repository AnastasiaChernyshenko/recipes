//
//  Factory.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//
import UIKit
class Factory {
    func makeSearchModule() -> SearchView {
      let storyboard = UIStoryboard(name: "SearchScreen", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchCollectionViewController
        controller.presenter = SearchPresenter(view: controller)
        return controller
    }
    
    func makeRecipeDetailModule(with recipe: Recipe) -> RecipeView {
      let storyboard = UIStoryboard(name: "DetailScreen", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
      controller.presenter = RecipePresenter(view: controller, recipe: recipe)
      return controller
    }
}
