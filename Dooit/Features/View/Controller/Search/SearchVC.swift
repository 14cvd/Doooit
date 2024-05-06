//
//  SearchVC.swift
//  Dooit
//
//  Created by cavID on 01.05.24.
//

import UIKit
import SnapKit

final class SearchVC: UIViewController {
    var coordinator : SearchCoordinator?
    private lazy var searchController : UISearchBar = {
       let sb = UISearchBar()
        sb.delegate = self
        sb.showsCancelButton = true
        sb.placeholder = "Search your list"
        sb.autocapitalizationType = .allCharacters
        return sb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchController.becomeFirstResponder()
        configNavigationBar()

    }
}

private extension SearchVC {
    func configNavigationBar(){
        
        navigationItem.hidesBackButton = true
        navigationItem.titleView = searchController
        
    }
}

extension SearchVC : UISearchBarDelegate  {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        coordinator?.back()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
                    cancelButton.setTitleColor(.black, for: .normal)
                }
    }
    
    
 }


