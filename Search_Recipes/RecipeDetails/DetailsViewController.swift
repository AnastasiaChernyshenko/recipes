//
//  DetailsViewController.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RecipeView {
    
    var presenter: RecipePresenter!
    
    let indexPathOfImage = IndexPath(row: 1, section: 0)
   
    var recipe: Recipe?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        presenter.onViewDidLoad()
    }
    
    //MARK:- TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let recipe = recipe else { return 0}
        switch section {
        case 0: return 2
        case 1: return recipe.ingredientLines.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Ingredients"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipe = recipe else { return UITableViewCell()}
        
        if indexPath == indexPathOfImage{
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeImageTableViewCell.identifier, for: indexPath) as! RecipeImageTableViewCell
            cell.configure(with: recipe)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        guard indexPath.section == 1 else {
            cell.textLabel?.text = recipe.label.capitalized
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            return cell
        }
        cell.textLabel?.text = recipe.ingredientLines[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- RecipeView
    func show(recipe: Recipe) {
        self.recipe = recipe
        tableView.reloadData()
    }
    
}
