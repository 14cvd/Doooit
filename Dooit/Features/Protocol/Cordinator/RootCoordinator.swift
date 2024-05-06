//
//  RootCoordinator.swift
//  Dooit
//
//  Created by cavID on 30.04.24.
//

import Foundation
import UIKit


class RootCoordinator : Coordinator {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = OnBoardingVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
   
    
    
    func showMainView() {
        let mainViewCoordinator = MainCoordinator(navigationController: navigationController)
        mainViewCoordinator.start()
    }
    
    
    
    

}
