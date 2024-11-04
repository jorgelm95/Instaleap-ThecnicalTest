//
//  TVShowRepositoryStub.swift
//  InstaFlixTests
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation
import Combine
@testable import InstaFlixDomain

final class TVShowRepositoryStub: TvShowRepository {
        
        var setFailureResponse: Bool  = false
        var error: FetchRequestErrors?
        
        func fetchTVShows() -> AnyPublisher<[TVShow], InstaFlixDomain.FetchRequestErrors> {
            if setFailureResponse {
                return Fail<[TVShow], FetchRequestErrors>(error: error ?? .undefined).eraseToAnyPublisher()
            } else {
                return Future<[TVShow], FetchRequestErrors> { promise in
                    promise(.success(DummyTVShowData.tvShows))
                }.eraseToAnyPublisher()
            }
        }
        
        func addFavoriteTVShow(tvShow: TVShow) {
            return
        }
        
        func fetchFavoriteTVShows() -> [TVShow] {
            return DummyTVShowData.tvShows
        }
    }
