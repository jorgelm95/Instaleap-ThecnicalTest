//
//  TVShowListPresenter.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation
import InstaFlixDomain

final class TVShowListPresenter: TVShowListPresenterType {
    
    // MARK: - Internal properties -
    var interactor: TVShowListInteractorType
    var router: TVShowListRouterType?
    unowned var view: TVShowListViewType
    
    // MARK: - LifeCycle -
    
    init(interactor: TVShowListInteractorType,
        view: TVShowListViewType,
        showFavoritesMovies: Bool) {
            self.interactor = interactor
            self.view = view
        }
    
    // MARK: - Internal methods -
    
    func fetchTVshows() {
        self.interactor.fetchTVshows()
    }
    
    func saveFavorite(index: Int) {
        self.interactor.saveFavorite(index: index)
    }
    
    func goToDetail(index: Int) {
        let tvShow = self.interactor.getTVShowBy(index: index)
        router?.goToDetailTVShowModule(tvShow)
    }
}

// MARK: - MovieIntInteractorOuputType -

extension TVShowListPresenter: TVShowInteractorOuputType {
    func showTVshows(_ items: [TVShow]) {
        view.removeLoading()
        view.showTVShows(items)
    }
    
    func manageRequestError(error: InstaFlixDomain.FetchRequestErrors) {
        view.removeLoading()
        switch error {
        case .invalidResponse:
            view.setListState(.emptyResults)
        case .undefined:
            view.setListState(.NetworkError)
        }
    }

    func showAlert() {
        view.showInformativeAlert()
    }
}
