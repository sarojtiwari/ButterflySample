//
//  UIViewControllerExtension.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 10/03/2023.
//

import UIKit

extension UIViewController {
    func showAlert(message: String) {
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true)
    }
}
