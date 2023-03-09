//
//  UIStoryboardExtension.swift
//  ButterflySample
//
//  Created by Saroj Tiwari on 09/03/2023.
//

import Foundation
import UIKit

protocol Storyboarding {
    static func instantiate(withStoryboard name: String) -> Self
}

extension Storyboarding where Self: UIViewController {
    static func instantiate(withStoryboard name: String = "") -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        let storyboardName: String = name.isEmpty ? className : name
        // load our storyboard
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
