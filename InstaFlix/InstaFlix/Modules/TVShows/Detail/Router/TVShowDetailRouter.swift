//
//  TVShowDetailRouter.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import UIKit
import InstaFlixDomain
import InstaFlixData

final class TVShowDetailRouter: MovieDetailRouterType {
    
    var viewControllerRef: UIViewController?
    
    static func buildModule(tvShow: TVShow) -> TVShowDetailViewController {
        
        let view = TVShowDetailViewController()
        
        let presenter = TVShowDetailPresenter(view: view)
        let router = TVShowDetailRouter()
        view.presenter = presenter
        router.viewControllerRef = view
        presenter.tvShowDetail = tvShow

        return view
    }
}
