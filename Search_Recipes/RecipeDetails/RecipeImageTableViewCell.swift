//
//  RecipeImageTableViewCell.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

import UIKit

class RecipeImageTableViewCell: UITableViewCell {
    
    static let identifier = "RecipeImage"
    
    private var recipe: Recipe?
    
    @IBOutlet weak var recipeImageView: UIImageView!
    
    public func configure(with recipe: Recipe){
        self.recipe = recipe
        NetworkService.shared.loadImage(imagePath: recipe.image, onSuccess: { [weak self] image in
            guard let image = image else { return }
            self?.recipeImageView.image = image
        })
    }
    
}
