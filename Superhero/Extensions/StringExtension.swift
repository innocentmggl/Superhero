//
//  StringExtension.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation

// MARK: - String Helpers
extension String {
    /**
     Get localised string.
     - Returns: Localized `String`  if `self`exist on localized string.

     ### Usage Example: ###
     ````
     "your string".localized()
     ````
     */
    func localized() -> String {
        return NSLocalizedString(self, tableName: "LocalizedString", comment: "")
    }
}

extension StringProtocol {
    ///Set  first letter of `Self` to uppercase
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
