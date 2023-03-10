//
//  MainCoordinator.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 09/03/2023.
//

import UIKit

class MainCoordinator: Coordinator {
    
    func start() {
        let controller = SearchListView.instantiate()
        let service = SearchListService()
        let viewModel = SearchListViewModel(service)
        controller.viewModel = viewModel
        controller.coordinator = self
        viewModel.viewType = controller
        self.navigationController.pushViewController(controller, animated: false)
    }
    
    func gotoMovieList(_ data: SearchListModel) {
        let controller = DetailView.instantiate()
        controller.model = data
        let service = DetailService()
        let viewModel = DetailViewModel(service)
        viewModel.viewType = controller
        controller.viewModel = viewModel
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(_ withNavigationController: UINavigationController) {
        self.navigationController = withNavigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
}
