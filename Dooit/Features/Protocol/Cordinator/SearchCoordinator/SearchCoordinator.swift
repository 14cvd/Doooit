//
//  SearchCoordinator.swift
//  Dooit
//
//  Created by cavID on 01.05.24.
//

import Foundation
import UIKit


class SearchCoordinator : Coordinator {
    
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SearchVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func back(){
        print("Back Button")
        
        navigationController.popViewController(animated: true)
    }
}
