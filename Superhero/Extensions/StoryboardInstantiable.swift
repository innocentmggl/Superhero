//
//  StoryboardInstantiable.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable: UIViewController {}

extension StoryboardInstantiable where Self: UIViewController {
    static func instantiate(storyboardName: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("Cannot instantiate view controller \(Self.self) from storyboard with class name \(className)")
        }
        return viewController
    }
}

extension NSObject {
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    var className: String {
        return type(of: self).className
    }
}
