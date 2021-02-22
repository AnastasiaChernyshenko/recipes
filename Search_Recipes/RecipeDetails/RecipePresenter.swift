//
//  RecipePresenter.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

class RecipePresenter{
    private var recipe: Recipe
    private weak var view: RecipeView?
    init(view: RecipeView, recipe: Recipe) {
        self.view = view
        self.recipe = recipe
    }
    
    func onViewDidLoad() {
        view?.show(recipe: recipe)
    }
}
