//
//  SearchPresenter.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

import Foundation

class SearchPresenter {
    
    private weak var view: SearchView?
    
    init(view: SearchView) {
        self.view = view
    }
    
    func onSearch(_ text: String?) {
        guard let text = text else { return }
        
        view?.showLoadingIndicator()
        NetworkService.shared.searchMovies(with: text, onSuccess:{ [weak self] recipes in
            self?.view?.hideLoadingIndicator()
            self?.view?.showSearchResults(recipes: recipes)
            
        }, onError: { [weak self] message in
            self?.view?.hideLoadingIndicator()
            self?.view?.showAlert(message: message)
        })
    }
    
    func onSelect(recipe: Recipe){
        view?.selectedRecipe?(recipe)
    }
}
