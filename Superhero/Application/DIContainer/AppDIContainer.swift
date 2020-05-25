//
//  AppDIContainer.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/23.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation
import Moya

/**
    Class that abstract the creation of dependancies
*/
final class AppDIContainer {
    // MARK: - Singleton instance
    static let shared = AppDIContainer()

    private init() {}

     // MARK: - SearchViewModel instance
    lazy var searchViewModel: SearchViewModel = {
        return DefaultSearchViewModel(searchRespository: superheroRepository, searchManager: searchManager)
    }()

    // MARK: - SuperheroRepository instance
    lazy var superheroRepository: SuperheroRepository = {
        return SuperheroRepositoryImplementation(provider: moyaProvider)
    }()
    // MARK: - SearchManager instance
    lazy var searchManager: SearchManager = {
        return DefaultSearchManager()
    }()

    // MARK: - Network instance
    lazy var moyaProvider: MoyaProvider<SuperheroApi> = {
        return MoyaProvider<SuperheroApi>()
    }()
}
