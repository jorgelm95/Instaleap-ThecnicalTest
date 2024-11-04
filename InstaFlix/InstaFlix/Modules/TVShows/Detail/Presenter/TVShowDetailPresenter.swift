//
//  TVShowDetailPresenter.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation
import InstaFlixDomain

final class TVShowDetailPresenter: TVShowDetailDetailPresenterType {
    
    unowned var view: TVShowDetailViewType
    var tvShowDetail: TVShow?
    
    init(view: TVShowDetailViewType) {
        self.view = view
    }
    
    func viewDidLoad() {
        guard let tvShowDetail else { return }
        view.showDetail(tvShowDetail)
    }
}
