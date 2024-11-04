//
//  TVShowListProtocols.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation
import UIKit
import InstaFlixDomain

protocol TVShowListInteractorType: AnyObject {
    var presenter: TVShowInteractorOuputType? { get set }
    var repository: TvShowRepository { get set }
    func fetchTVshows()
    func fetchFavoriesTVShows()
    func getTVShowBy(index: Int) -> TVShow
    func saveFavorite(index: Int)
}

protocol TVShowInteractorOuputType: AnyObject {
    func showTVshows(_ items: [TVShow])
    func manageRequestError(error: FetchRequestErrors)
    func showAlert()
}

protocol TVShowListRouterType: AnyObject {
    var viewControllerRef: UIViewController? { get set }
    func goToDetailTVShowModule(_ tvShow: TVShow)
}

protocol TVShowListPresenterType: AnyObject {
    var interactor: TVShowListInteractorType { get set }
    var view: TVShowListViewType { get set }
    var router: TVShowListRouterType? { get set }
    
    func fetchTVshows()
    func saveFavorite(index: Int)
    func goToDetail(index: Int)
}

protocol TVShowListViewType: AnyObject {
    var presenter: TVShowListPresenterType? { get set }
    func setListState(_ state: ItemsListState)
    func showTVShows(_ tvShows: [TVShow])
    func removeLoading()
    func showInformativeAlert()
}

protocol saveFavoriteTVshowViewDelegate {
    func saveMovie(movie: Movie)
}

enum TVShowListState {
    case initialEmpty
    case filled
    case emptyResults
    case NetworkError
}
