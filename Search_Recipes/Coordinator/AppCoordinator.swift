//
//  AppCoordinator.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//
class AppCoordinator: Coordinator {
  
  private let router: Router
  private let factory: Factory
  
  init(router: Router, factory: Factory = .init()) {
    self.router = router
    self.factory = factory
  }
  
  func start() {
    showSearchModule()
  }

  private func showSearchModule() {
    let searchModule = factory.makeSearchModule()
    searchModule.selectedRecipe = { [weak self] recipe in
        self?.showRecipeDetails(with: recipe)
    }
    router.setRootModule(searchModule)
  }
  
  private func showRecipeDetails(with recipe: Recipe) {
    let detailModule = factory.makeRecipeDetailModule(with: recipe)
    router.push(detailModule)
  }
}
