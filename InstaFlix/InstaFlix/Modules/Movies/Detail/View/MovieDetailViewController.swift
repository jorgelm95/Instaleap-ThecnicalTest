//
//  MovieDetailViewController.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 26/09/24.
//

import UIKit
import InstaFlixDomain

final class MovieDetailViewController: GenericListViewController<MovieDetailTableViewCell>, MovieDetailViewType {
    
    var presenter: MovieDetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func showDetail(_ movie: Movie) {
        self.items = [movie]
    }
}
