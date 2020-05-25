//
//  SuperheroItemCell.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import UIKit
import SDWebImage
///This class manages the displaying of superhero item in a a table view cell
final class SuperheroItemCell: UITableViewCell {

    static let reuseIdentifier = String(describing: SuperheroItemCell.self)
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var firstAppearedLabel: UILabel!

    /**
     Set superhero content views values .
     - Parameters:
        - item: The superhero item to show.
     */
    func configure(with item: Superhero) {
        nameLabel.text = item.name
        fullNameLabel.text = item.biography.fullName
        firstAppearedLabel.text = "first.appeared".localized() + item.biography.firstAppearance
        self.avatar.sd_setImage(with: item.image.url, placeholderImage: UIImage(named: "placeholder.png"))
    }
}
