//
//  LoadingIndicactor.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import UIKit

/**
    Protocol that provides methods for managing the showing of loading indicator in a view controller
*/

public protocol LoadingIndicactor {}

var loadingView: UIView?

public extension LoadingIndicactor where Self: UIViewController {
    /**
     Create and show loading indicator .
     - Parameters:
        - onView: `UIView` The view you want to present the loading indiicator on.
     */
    func showSpinner(onView: UIView) {
        guard !(loadingView?.isDescendant(of: onView) ?? false) else {
            return
        }
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let loadingIndicator = UIActivityIndicatorView.init(style: .whiteLarge)
        loadingIndicator.startAnimating()
        loadingIndicator.center = spinnerView.center

        DispatchQueue.main.async {
            spinnerView.addSubview(loadingIndicator)
            onView.addSubview(spinnerView)
        }
        loadingView = spinnerView
    }

    /// hides  loading indicator .
    func hideSpinner() {
        DispatchQueue.main.async {
            loadingView?.removeFromSuperview()
            loadingView = nil
        }
    }

}
