//
//  MovieListViewSpy.swift
//  InstaFlixTests
//
//  Created by Jorge Luis Menco Jaraba on 26/09/24.
//

import Foundation
@testable import InstaFlix
@testable import InstaFlixDomain

final class MovieListViewSpy: MovieListViewType {
    
    enum Invocation: Int {
        case removeLoadingView
        case showInformativeAlert
        case setListState
        case showMovies
    }
    
    var presenter: MovieListPresenterType?
    var invoctations: [Invocation] = []
    
    func removeLoading() {
        invoctations.append(.removeLoadingView)
    }
    
    func showInformativeAlert() {
        invoctations.append(.showInformativeAlert)
    }
    
    func setListState(_ state: InstaFlix.ItemsListState) {
        invoctations.append(.setListState)
    }
    
    func showMovies(with movies: [InstaFlixDomain.Movie]) {
        invoctations.append(.showMovies)
    }
}
