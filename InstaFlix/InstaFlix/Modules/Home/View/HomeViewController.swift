//
//  HomeViewController.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 25/09/24.
//

import Foundation
import UIKit

final class HomeViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {

        let moviesViewController = MovieListRouter.buildModule()
        moviesViewController.tabBarItem =  UITabBarItem(
            title: "Movies",
            image: UIImage(systemName: "movieclapper"),
            selectedImage: nil)
        
        let tvShowsViewController = TVShowListRouter.buildModule()
        tvShowsViewController.tabBarItem =  UITabBarItem(
            title: "TV Shows",
            image: UIImage(systemName: "popcorn"),
            selectedImage: nil)
        
        let favoritesViewController = MovieListRouter.buildModule(isFavoritesMovies: true)
        favoritesViewController.tabBarItem =  UITabBarItem(
            title: "Favorires",
            image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        
        let tabBarList = [moviesViewController, tvShowsViewController, favoritesViewController]
        self.viewControllers = tabBarList.map {
            let navController = UINavigationController(rootViewController: $0)
            return navController
        }
    }
}
