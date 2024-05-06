//
//  AllListCoordinator.swift
//  Dooit
//
//  Created by cavID on 01.05.24.
//

import Foundation
import UIKit


class AllListCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("1")
        let vc = AllListVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showCreatedListView(){
        print("2")
        let createdListController = CreatedListCoordinator(navigationController: navigationController)
        createdListController.start()
    }
    
    func navigationPop(){
        
    }
    
    func getAllListVC() -> UIViewController {
        let vc = AllListVC()
        vc.coordinator = self
        return vc
    }
    
}

