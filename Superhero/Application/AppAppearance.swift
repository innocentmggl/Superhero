//
//  AppAppearance.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import  UIKit
/**
    Global app appearance configuration class
*/
final class AppAppearance {
    /**
     Setup global app navigation bar appearance 
     */
    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .darkGray
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.customFont(fontFace: .medium, size: .xxLarge),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    }
}
