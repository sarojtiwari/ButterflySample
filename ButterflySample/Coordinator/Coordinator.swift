//
//  Coordinator.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 09/03/2023.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    func start()
}
