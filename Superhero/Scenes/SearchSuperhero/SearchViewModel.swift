//
//  SearchViewModel.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Foundation

enum Router {
    case none
    case showDetails(with: ShowDetailsViewModel)
}

// MARK: - INPUTS
protocol SearchViewModelInput {
    func search(superhero: String?)
    func selectedItem(at index: Int)
}

// MARK: - OUTPUTS
protocol SearchViewModelOutput {
    var items: Box<[Superhero]> { get }
    var error: Box<String> { get }
    var loading: Box<Bool> { get }
    var message: Box<String> { get }
    var route: Box<Router> { get }
}

protocol SearchViewModel: SearchViewModelInput, SearchViewModelOutput {}

/// Simple class that implements `SearchViewModel` and provides inputs and outputs for `SearchViewController` 
final class DefaultSearchViewModel: SearchViewModel {

    let repository: SuperheroRepository
    let searchManager: SearchManager

    // MARK: - OUTPUTS
    let items: Box<[Superhero]> = Box([Superhero]())
    let error: Box<String> = Box("")
    let loading: Box<Bool> = Box(false)
    let message: Box<String> = Box("")
    let route: Box<Router> = Box(.none)

    init(searchRespository: SuperheroRepository, searchManager: SearchManager) {
        self.repository = searchRespository
        self.searchManager = searchManager
    }

    // MARK: - INPUTS
    /**
     Queue a search request  to be executed later if not cancelled.
     - Parameters:
        - superhero: The superhero searched for.
     */
    func search(superhero: String?) {
        guard let searchfor = superhero, !searchfor.isEmpty else {
            setSuperheroItems()
            message.value = ""
            return
        }
        searchManager.debounce(forSearch: searchfor) {[unowned self] in
            self.performSearch(query: searchfor)
        }
    }
    /**
     Creates a route with a view model of passing in the selected item from a table view.
     - Parameters:
        - index: Index of selected item.
     */
    func selectedItem(at index: Int) {
        let superhero = items.value[index]
        let viewModel = DefaultShowDetailsViewModel(superhero: superhero)
        route.value = .showDetails(with: viewModel)
    }

    /**
     Call repository search for a superheroes.
     - Parameters:
        - query: the superhero name string
     */
    func performSearch(query: String) {
        self.repository.requests.value.forEach({ $0.cancel() })
        self.loading.value = true
        self.repository.searchSuperhero(name: query) { results in
            self.loading.value = false
            switch results {
            case .success(let superheroes):
                self.setSuperheroItems(superheroes: superheroes)
            case .failure(let error):
                self.handleApiFailure(error: error)
            }
        }
    }

    /**
     Set superhero items .
     - Parameters:
        - superheroes: the superheros array, if `superheroes` is nill this method will set to empty items
     */
    private func setSuperheroItems(superheroes: [Superhero] = [Superhero]()) {
        self.items.value = superheroes
    }

    /**
     Handles api error response.
     - Parameters:
        - error: enum error object
     */
    private func handleApiFailure(error: ApiError) {
        setSuperheroItems()
        switch error {
        case .known(let message):
            if let message = message {
                self.message.value = message.firstUppercased
            } else {
                self.error.value = "error.unknown".localized()
            }
        case .unknown(let error):
            if let error = error {
                self.error.value = error.localizedDescription
            } else {
                self.error.value = "error.unknown".localized()
            }
        }
    }
}
