//
//  UITableView+UIViews.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import UIKit

// MARK: - UIFont Helpers
extension UITableView {
    /**
     Creates and set table view background view.

     - Parameters:
        - title: `String`
        - message: `String`
     */
    func setBackgroundView(with title: String, for message: String, imageName: String) {
        let emptyView = UIView(frame: self.bounds)

        let titleLabel = createLabel(labelText: title)
        let messageLabel = createLabel(labelText: message, fontFace: .book, fontSize: .medium)
        let imageView = createIcon(imageName: imageName)

        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        emptyView.addSubview(imageView)

        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true

        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true

        imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        _ = imageView.widthAnchor.constraint(equalToConstant: 50)
        _ = imageView.heightAnchor.constraint(equalToConstant: 50)

        self.backgroundView = emptyView
    }
    /**
     Helper method to create label
     - Parameters:
        - labelText: `String`
        - fontFace: `FontFace enum`
        - fontSize: `FontSize enum`
     */
    private func createLabel(labelText: String, fontFace: FontFace = .medium, fontSize: FontSize = .large) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.text = labelText
        label.font = UIFont.customFont(fontFace: fontFace, size: fontSize)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    /**
     Helper method to create image view
     - Parameters:
        - imageName: `String` name for the image file
     */
    private func createIcon(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: imageName)
        return imageView
    }
}

extension UISearchBar {
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else {
            guard let searchTextField = self.value(forKey: "searchField") as? UITextField else {
                if let textfield = self.value(forKey: "_searchField") as? UITextField {
                    return textfield
                }
                return nil
            }
            return searchTextField
        }
    }
}

extension UIView {
    /**
     Rounds the given set of corners to the specified radius
     - Parameters:
        - corners: Corners to round.
        - radius:  Radius to round to
     */
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
