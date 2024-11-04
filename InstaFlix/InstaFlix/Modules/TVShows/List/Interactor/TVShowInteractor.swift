//
//  TVShowInteractor.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation
import Combine
import InstaFlixDomain

final class TVShowInteractor: TVShowListInteractorType {
    
    // MARK: - Private properties -
    
    private var cancellable = Set<AnyCancellable>()
    private var tvShows: [TVShow] = []
    
    // MARK: - Internal properties -
    
    weak var presenter: TVShowInteractorOuputType?
    var repository: TvShowRepository
    
    // MARK: - LifeCycle -
    
    init(repository: TvShowRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal methods -
    
    func fetchTVshows() {
        self.repository.fetchTVShows().sink { [weak self] completion in
            guard let self else { return }
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self.tvShows = []
                self.presenter?.manageRequestError(error: error)
            }
        } receiveValue: { [weak self] result in
            guard let self else { return }
            self.tvShows = result
            self.presenter?.showTVshows(result)
        }.store(in: &cancellable)
    }
    
    func fetchFavoriesTVShows() {
        let favorites = self.repository.fetchFavoriteTVShows()
        self.presenter?.showTVshows(favorites)
    }
    
    func saveFavorite(index: Int) {
        let tvShowToSave = self.getTVShowBy(index: index)
        self.repository.addFavoriteTVShow(tvShow: tvShowToSave)
        self.presenter?.showAlert()
    }
    
    func getTVShowBy(index: Int) -> TVShow {
        return self.tvShows[index]
    }
}
