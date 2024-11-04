//
//  TVShowListViewController.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import UIKit
import InstaFlixDomain

final class TVShowListViewController: GenericListViewController<TVShowListTableViewCell>, TVShowListViewType {
    
    var presenter: TVShowListPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveFavoriteItemDelegate = self
        self.retryDelegate = self
        self.navigateToDetailDelegate = self
        self.title = Strings.ListTVShow.listTVShowsTitle
        presenter?.fetchTVshows()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchTVshows()
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
    
    func showTVShows(_ tvShows: [TVShow]) {
        self.items = tvShows
        self.tableViewState = .filled
    }
    
    func removeLoading() {
        self.removeLoadingView()
    }
    
    func setListState(_ state: ItemsListState) {
        self.tableViewState = state
    }
    
    // MARK: - Private methods -
}

// MARK: - SaveFavoriteItemDelegate -

extension TVShowListViewController: SaveFavoriteItemDelegate {
    func saveItem(index: Int) {
        presenter?.saveFavorite(index: index)
    }
}

// MARK: - RetryDataDelegate -

extension TVShowListViewController: RetryDataDelegate {
    func retryGetData() {
        guard let presenter else { return }
        presenter.fetchTVshows()
    }
}

// MARK: - RetryDataDelegate -

extension TVShowListViewController: NavigateToDetailDelegate {
    func goToDetail(index: Int) {
        presenter?.goToDetail(index: index)
    }
}
