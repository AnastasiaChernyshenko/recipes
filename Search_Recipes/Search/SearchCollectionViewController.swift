//
//  SearchCollectionViewController.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//

import UIKit

class SearchCollectionViewController: UICollectionViewController,UISearchBarDelegate,UICollectionViewDelegateFlowLayout, SearchView {
    
    var presenter: SearchPresenter!
    private var searchResult: [SearchRecipe]?
    var selectedRecipe: ((Recipe) -> Void)?
    
    let itemsPerRow:CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    private var searchBar:UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search..."
        searchBar.backgroundColor = .secondarySystemBackground
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.titleView = searchBar
        searchBar.delegate = self
        presenter.onSearch("ap")
    }
    
    //MARK:- SearchView
    
    func showSearchResults(recipes: [SearchRecipe]) {
        searchResult = recipes
        collectionView.reloadData()
    }
    
    // MARK:- UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let searchResult = searchResult else { return 0}
        return searchResult.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let searchResult = searchResult else { return UICollectionViewCell()}
        let recipe = searchResult[indexPath.row].recipe
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifier, for: indexPath) as! RecipeCollectionViewCell
        cell.configure(with: recipe)
        cell.dropShadow()
        return cell
    }
    
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let searchResult = searchResult else { return}
        let recipe = searchResult[indexPath.row].recipe
        presenter.onSelect(recipe: recipe)
    }
    
    
    //MARK:- UICollectionViewLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    
    //MARK:- UISearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.onSearch(searchBar.text)
        searchBar.resignFirstResponder()
    }
    
}
