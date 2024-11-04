//
//  TVShowDetailViewController.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation
import InstaFlixDomain

final class TVShowDetailViewController: GenericListViewController<TVShowDetailTableViewCell>, TVShowDetailViewType {
    
    var presenter: TVShowDetailDetailPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func showDetail(_ tvShow: TVShow) {
        self.items = [tvShow]
    }
}
