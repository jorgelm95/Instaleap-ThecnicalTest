//
//  MovieListPresenter.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 25/09/24.
//

import Foundation
import InstaFlixDomain

final class MovieListPresenter: MovieListPresenterType {
    
    // MARK: - Internal properties -
    var interactor: MovieListInteractorType
    var router: MovieListRouterType?
    var shouldShouwFavoriteMovie: Bool
    unowned var view: MovieListViewType
    
    // MARK: - LifeCycle -
    
    init(interactor: MovieListInteractorType,
        view: MovieListViewType,
        showFavoritesMovies: Bool) {
            self.interactor = interactor
            self.view = view
            self.shouldShouwFavoriteMovie = showFavoritesMovies
        }
    
    // MARK: - Internal methods -
    
    func fetchMovies() {
        if shouldShouwFavoriteMovie {
            self.interactor.fetchFavoriesMovies()
        } else {
            self.interactor.fetchMovies()
        }
    }
    
    func saveFavorite(index: Int) {
        self.interactor.saveFavorite(index: index)
    }
    
    
    func goToMovieDetail(index: Int) {
        let movie = interactor.getMovieBy(index: index)
        router?.goToDetailMovietModule(movie)
    }
}

// MARK: - MovieIntInteractorOuputType -

extension MovieListPresenter: MovieIntInteractorOuputType {
    func showMovies(_ items: [Movie]) {
        view.removeLoading()
        view.showMovies(with: items)
    }
    
    func manageRequestError(error: FetchRequestErrors) {
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
