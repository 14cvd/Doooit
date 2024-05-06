//
//  CreateListCoordinator.swift
//  Dooit
//
//  Created by cavID on 01.05.24.
//

import Foundation
import UIKit


class CreatedListCoordinator : Coordinator {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CreatedListVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigationPop(){

        navigationController.popViewController(animated: true)
    }
    
    
}
