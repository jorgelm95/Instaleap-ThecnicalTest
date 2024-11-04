//
//  MovieListInteractor.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 25/09/24.
//

import Foundation
import Combine
import InstaFlixDomain

final class MovieListInteractor: MovieListInteractorType {
    
    // MARK: - Private properties -
    
    private var cancellable = Set<AnyCancellable>()
    private var movies: [Movie] = []
    
    // MARK: - Internal properties -
    
    weak var presenter: MovieIntInteractorOuputType?
    var repository: MovieRepository
    
    // MARK: - LifeCycle -
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal methods -
    
    func fetchMovies() {
        self.repository.fetchMovies().sink { [weak self] completion in
            guard let self else { return }
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self.presenter?.manageRequestError(error: error)
            }
        } receiveValue: { [weak self] result in
            guard let self else { return }
            self.movies = result
            self.presenter?.showMovies(result)
        }.store(in: &cancellable)
    }
    
    func fetchFavoriesMovies() {
        let favoriteMovies = self.repository.fetchFavoriteMovies()
        self.movies = favoriteMovies
        self.presenter?.showMovies(favoriteMovies)
    }
    
    func saveFavorite(index: Int) {
        let movieToSave = getMovieBy(index: index)
        self.repository.addFavoriteMovie(movie: movieToSave)
        self.presenter?.showAlert()
    }
    
    func getMovieBy(index: Int) -> Movie {
        return self.movies[index]
    }
}
