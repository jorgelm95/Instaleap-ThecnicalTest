//
//  TVShowListRouter.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import UIKit
import InstaFlixDomain
import InstaFlixData
import InstaFlixNetworking

final class TVShowListRouter: TVShowListRouterType {
    
    weak var viewControllerRef: UIViewController?
    
    static func buildModule(isFavoritesMovies: Bool = false) -> TVShowListViewController {
        
        let repository: TvShowRepository = FetchTVShowRepository(
            serviceManager: ServiceManager(),
            adapater: TVShowMapperAdapater(),
            localStorageManager: RealmStorageManager())
        
        let interactor = TVShowInteractor(repository: repository)
        let view = TVShowListViewController()
        let presenter = TVShowListPresenter(
            interactor: interactor,
            view: view, showFavoritesMovies: isFavoritesMovies)
        let router = TVShowListRouter()
        view.presenter = presenter
        router.viewControllerRef = view
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func goToDetailTVShowModule(_ tvShow: InstaFlixDomain.TVShow) {
        guard let navigationController = viewControllerRef?.navigationController else { return }
        let viewController =  TVShowDetailRouter.buildModule(tvShow: tvShow)
        navigationController.pushViewController(viewController, animated: true)
    }
}
