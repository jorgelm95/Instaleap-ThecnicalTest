//
//  MovieRepositoryStub.swift
//  InstaFlixTests
//
//  Created by Jorge Luis Menco Jaraba on 26/09/24.
//

import Foundation
import Combine
@testable import InstaFlixDomain

final class MovieRepositoryStub: MovieRepository {
    
    var setFailureResponse: Bool  = false
    var error: FetchRequestErrors?
    
    func addFavoriteMovie(movie: Movie) {
        //Todo mock implementation
    }
    
    func fetchFavoriteMovies() -> [Movie] {
        return []
    }
    
    func fetchMovies() -> AnyPublisher<[Movie], FetchRequestErrors> {
        if setFailureResponse {
            return Fail<[Movie], FetchRequestErrors>(error: error ?? .undefined).eraseToAnyPublisher()
        } else {
            return Future<[Movie], FetchRequestErrors> { promise in
                promise(.success([DummyMovieData.movieData]))
            }.eraseToAnyPublisher()
        }
    }
}
