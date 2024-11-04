//
//  TVShowInteractorStub.swift
//  InstaFlixTests
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation
@testable import InstaFlixDomain
@testable import InstaFlix

final class TVShowInteractorStub: TVShowListInteractorType {
    
    var setFailureResponse: Bool  = false
    var error: FetchRequestErrors?
    var presenter: TVShowInteractorOuputType?
    
    var repository: TvShowRepository
    
    init(repository: TvShowRepository) {
        self.repository = repository
    }
    
    func fetchTVshows() {
        if setFailureResponse {
            presenter?.manageRequestError(error: error ?? .undefined)
        } else {
            presenter?.showTVshows(DummyTVShowData.tvShows)
        }
    }
    
    func fetchFavoriesTVShows() {
        if setFailureResponse {
            presenter?.manageRequestError(error: error ?? .undefined)
        } else {
            presenter?.showTVshows(DummyTVShowData.tvShows)
        }
    }
    
    func getTVShowBy(index: Int) -> InstaFlixDomain.TVShow {
        return DummyTVShowData.tvShows[index]
    }
    
    func saveFavorite(index: Int) {
        presenter?.showAlert()
    }
    
}
