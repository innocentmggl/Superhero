//
//  ShowDetailsViewModel.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation

// MARK: - OUTPUTS
protocol ShowDetailsViewModelOutput {
    var superhero: Superhero { get }
}

protocol ShowDetailsViewModel: ShowDetailsViewModelOutput {}

/// Simple class that implements `ShowDetailsViewModel` and provides inputs and outputs for `ShowDetailsViewController`
final class DefaultShowDetailsViewModel: ShowDetailsViewModel {

    let superhero: Superhero

    init(superhero: Superhero) {
        self.superhero = superhero
    }
}
