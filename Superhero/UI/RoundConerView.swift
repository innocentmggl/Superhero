//
//  CollapsableView.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/24.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import UIKit

/**
    `UIView` helper class to set  round corners to a view
*/
class RoundConerView: UIView {

    // MARK: - UIView lifecycle methods
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners([.topLeft, .topRight], radius: 20)
    }
}
