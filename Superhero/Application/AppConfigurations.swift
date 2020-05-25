//
//  AppConfigurations.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/23.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation
import Keys

/**
   Base Api url configurations
*/
enum BaseUrl: String {
    case dev = "https://superheroapi.com/api"
}

/**
   Singleton data provider class for setting up app specific configurations.
*/
final class AppConfigurations {

    static let shared = AppConfigurations()

    private init() {}

    lazy var keys = SuperheroKeys()

    lazy var environmentUrl: BaseUrl = {
        return .dev
    }()

    lazy var accessToken: String = {
        return keys.accessToken
    }()

    lazy var apiBaseUrl: String = {
        return environmentUrl.rawValue
    }()
}
