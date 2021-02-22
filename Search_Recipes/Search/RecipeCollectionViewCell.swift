//
//  RecipeCollectionViewCell.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecipeCollectionViewCell"
    
    private var recipe: Recipe?
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    
    @IBOutlet weak var blurView: UIView!
    
    public func configure(with recipe: Recipe){
        self.recipe = recipe
        recipeLabel.text = recipe.label.capitalized
        NetworkService.shared.loadImage(imagePath: recipe.image, onSuccess: { [weak self] image in
            guard let image = image else { return }
            self?.recipeImage.image = image
        })
    }
    
}
