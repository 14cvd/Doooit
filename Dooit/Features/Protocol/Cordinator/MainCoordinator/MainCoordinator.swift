//
//  MainCoordinator.swift
//  Dooit
//
//  Created by cavID on 30.04.24.
//

import Foundation
import UIKit


class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let controllers = getControllers()
        let vc = MainVC(viewControllers: controllers)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    //    func start() {
    //        let vc = DraftVC()
    ////        vc.coordinator = self
    //        navigationController.pushViewController(vc, animated: true)
    //    }
    
    func showSearchView(){
        let searchViewController = SearchCoordinator(navigationController: navigationController)
        searchViewController.start()
    }
    
    func showCreatedListView(){
        let createdListController = CreatedListCoordinator(navigationController: navigationController)
        createdListController.start()
    }
    
    private func getControllers() -> [UIViewController] {
        let allListCoordinator = AllListCoordinator(navigationController: self.navigationController)
        let pinnedCoordinator = PinnedCoordinator(navigationController: self.navigationController)
        
        guard let allListController = allListCoordinator.getAllListVC() as? AllListVC else {
            return []
        }
        
        guard let pinnedController = pinnedCoordinator.getPinnedVC() as? PinnedVC else {
            return []
        }
        
        return [allListController, pinnedController]
    }
}
