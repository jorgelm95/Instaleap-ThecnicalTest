//
//  MovieListsProtocols.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 25/09/24.
//

import UIKit
import InstaFlixDomain

protocol MovieListInteractorType: AnyObject {
    var presenter: MovieIntInteractorOuputType? { get set }
    var repository: MovieRepository { get set }
    func fetchMovies()
    func getMovieBy(index: Int) -> Movie
    func fetchFavoriesMovies()
    func saveFavorite(index: Int)
}

protocol MovieIntInteractorOuputType: AnyObject {
    func showMovies(_ items: [Movie])
    func manageRequestError(error: FetchRequestErrors)
    func showAlert()
}

protocol MovieListRouterType: AnyObject {
    var viewControllerRef: UIViewController? { get set }
    func goToDetailMovietModule(_ movieDetail: Movie)
}

protocol MovieListPresenterType: AnyObject {
    var shouldShouwFavoriteMovie: Bool { get set }
    var interactor: MovieListInteractorType { get set }
    var view: MovieListViewType { get set }
    var router: MovieListRouterType? { get set }
    
    func fetchMovies()
    func saveFavorite(index: Int)
    func goToMovieDetail(index: Int)
}

protocol MovieListViewType: AnyObject {
    var presenter: MovieListPresenterType? { get set }
    func setListState(_ state: ItemsListState)
    func removeLoading()
    func showMovies(with movies: [Movie])
    func showInformativeAlert()
}

enum ItemsListState {
    case initialEmpty
    case filled
    case emptyResults
    case NetworkError
}
