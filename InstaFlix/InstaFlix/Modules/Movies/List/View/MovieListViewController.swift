//
//  MovieListViewController.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 25/09/24.
//

import UIKit
import InstaFlixDomain

final class MovieListViewController: GenericListViewController<MovieListTableViewCell>, MovieListViewType {
    
    var presenter: MovieListPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveFavoriteItemDelegate = self
        self.retryDelegate = self
        self.navigateToDetailDelegate = self
        self.title = Strings.ListMovies.screenTitle
        presenter?.fetchMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchMovies()
    }
    
    // MARK: - internal methods -
    func showInformativeAlert() {
        let alert = UIAlertController(
            title: Strings.ListMovies.addMovieSuccessTitle,
            message: Strings.ListMovies.addMovieSuccessMessage,
            preferredStyle: .alert)
               
        let okAction = UIAlertAction(title: Strings.ListMovies.addMovieAlertButtonTitle, style: .default)
               
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showMovies(with movies: [Movie]) {
        self.items = movies
        self.tableViewState = .filled
    }
    
    func removeLoading() {
        self.removeLoadingView()
    }
    
    func setListState(_ state: ItemsListState) {
        self.tableViewState = state
    }
}

// MARK: - SaveFavoriteItemDelegate -

extension MovieListViewController: SaveFavoriteItemDelegate {
    func saveItem(index: Int) {
        presenter?.saveFavorite(index: index)
    }
}

// MARK: - RetryDataDelegate -

extension MovieListViewController: RetryDataDelegate {
    func retryGetData() {
        guard let presenter else { return }
        presenter.fetchMovies()
    }
}

// MARK: - RetryDataDelegate -

extension MovieListViewController: NavigateToDetailDelegate {
    func goToDetail(index: Int) {
        presenter?.goToMovieDetail(index: index)
    }
}


