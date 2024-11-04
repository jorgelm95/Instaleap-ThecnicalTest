//
//  TVShowDetailProtocols.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import UIKit
import InstaFlixDomain

protocol TVShowDetailViewType: AnyObject {
    var presenter: TVShowDetailDetailPresenterType? { get set }
    func showDetail(_ tvShow: TVShow)
}

protocol TVShowDetailDetailPresenterType: AnyObject {
    var view: TVShowDetailViewType { get set }
    var tvShowDetail: TVShow? { get set }
    
    func viewDidLoad()
}

protocol TVShowDetailRouterType {
    var viewControllerRef: UIViewController? { get set }
}
