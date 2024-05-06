//
//  PinnedCoordinator.swift
//  Dooit
//
//  Created by cavID on 02.05.24.
//
import Foundation
import UIKit


class PinnedCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("1")
        let vc = PinnedVC()
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
    
    func getPinnedVC() -> UIViewController {
        let vc = PinnedVC()
        vc.coordinator = self
        return vc
    }
    
}

