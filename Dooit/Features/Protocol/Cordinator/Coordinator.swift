//
//  Coordinator.swift
//  Dooit
//
//  Created by cavID on 30.04.24.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController : UINavigationController {get set}
    func start()
}
