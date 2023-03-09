//
//  MainCoordinator.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 09/03/2023.
//

import UIKit

class MainCoordinator: Coordinator {
    func start() {
        let controller = PurchaseListView.instantiate()
        self.navigationController.pushViewController(controller, animated: false)
    }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(_ withNavigationController: UINavigationController) {
        self.navigationController = withNavigationController
        navigationController.navigationBar.prefersLargeTitles = true
    }
}
