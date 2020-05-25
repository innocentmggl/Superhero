//
//  SearchViewController.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import UIKit
///View controller to manage the searching of  superhero characters and showing search result list
class SearchViewController: UIViewController, Alertable, LoadingIndicactor {

    private let searchController = UISearchController(searchResultsController: nil)
    private let viewModel: SearchViewModel = AppDIContainer.shared.searchViewModel
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.setBackgroundView(with: "search.message.title".localized(), for: "search.message.description".localized(), imageName: "search")
        }
    }

    // MARK: - VIEW CONTROLLER LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind(to: viewModel)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = true
    }

    // MARK: - HELPER METHODS
    private func setupViews() {
        self.title = "search.title".localized()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "search.searchController.placeholder".localized()
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
        searchController.searchBar.textField?.clearButtonMode = .whileEditing
    }

    func handleRoute(route: Router) {
        switch route {
        case .none: break
        case .showDetails(let viewModel):
            let detailVC = ShowDetailsViewController.create(with: viewModel)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    ///binds view model property
    private func bind(to viewModel: SearchViewModel) {
        viewModel.items.bind { [unowned self] _ in
            self.tableView.backgroundView = nil
            self.tableView.reloadData()
        }
        viewModel.error.bind { [unowned self] in
            if !$0.isEmpty {
                self.showAlert(title: "error.title".localized(), message: $0)
            }
        }
        viewModel.loading.bind { [unowned self] loading in
            loading ? self.showSpinner(onView: self.view) : self.hideSpinner()
        }
        viewModel.message.bind { [unowned self]  in
            if !$0.isEmpty {
                self.tableView.setBackgroundView(with: "", for: $0, imageName: "retry")
            } else {
                self.tableView.setBackgroundView(with: "search.message.title".localized(), for: "search.message.description".localized(), imageName: "search")
            }
        }
        viewModel.route.bind { [unowned self] route in
            self.handleRoute(route: route)
        }
    }
}
// MARK: - SEARCH CONTROLLER  DELEGATE
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.search(superhero: searchController.searchBar.text)
    }
}
// MARK: - UI SEARCH BAR  DELEGATE
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.dismiss(animated: true)
        viewModel.search(superhero: searchBar.text)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.dismiss(animated: true)
    }
}
// MARK: - TABLE VIEW  DELEGATE
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.selectedItem(at: indexPath.row)
        searchController.dismiss(animated: true)
    }
}
// MARK: - TABLE VIEW DATASOURCE
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SuperheroItemCell.reuseIdentifier, for: indexPath) as? SuperheroItemCell else {
             fatalError("Cannot dequeue reusable cell \(SuperheroItemCell.self) with reuseIdentifier: \(SuperheroItemCell.reuseIdentifier)")
         }
         cell.configure(with: viewModel.items.value[indexPath.row])
         return cell
    }
}
