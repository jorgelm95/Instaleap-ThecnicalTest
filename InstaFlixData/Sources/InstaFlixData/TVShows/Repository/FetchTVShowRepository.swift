//
//  FetchTVShowRepository.swift
//
//
//  Created by Jorge Luis Menco Jaraba on 1/11/24.
//

import Foundation
import Combine
import InstaFlixDomain
import InstaFlixNetworking
import RealmSwift

final public class FetchTVShowRepository: TvShowRepository {
    let localStorageService: LocalStorageServiceType
    let serviceManager: ServiceManagerType
    let tvShowMapperAdapater: TVShowMapperAdapaterAble
    
    public init(
        serviceManager: ServiceManagerType,
        adapater: TVShowMapperAdapaterAble,
        localStorageManager: LocalStorageServiceType) {
            self.serviceManager = serviceManager
            self.tvShowMapperAdapater = adapater
            self.localStorageService = localStorageManager
        }
    
    public func fetchTVShows() -> AnyPublisher<[TVShow], FetchRequestErrors> {
        let request = FetchTVShowsRequest()
        return serviceManager.execute(request)
            .map({ self.tvShowMapperAdapater.mapTVShowToDomainModel(apiData: $0.response) })
            .mapError({ self.mapperError(error: $0) })
            .eraseToAnyPublisher()
    }
    
    private func mapperError(error: ErrorHTTP.API) -> FetchRequestErrors {
        switch error {
        case .invalidResponse:
            return .invalidResponse
        case .undefined:
            return .undefined
        }
    }
    
    public func addFavoriteTVShow(tvShow: TVShow) {
        let localTVshow = LocalTVShow()
        localTVshow.id = tvShow.id
        localTVshow.name = tvShow.name
        localTVshow.overview = tvShow.overview
        localTVshow.popularity = tvShow.popularity
        localTVshow.voteCount = tvShow.voteCount
        localTVshow.posterPath = tvShow.posterPath
        localTVshow.adult = tvShow.adult
        
        localStorageService.addTVShow(tvShow: localTVshow)
    }
    
    public func fetchFavoriteTVShows() -> [TVShow] {
        let result = localStorageService.fetchFavoriteTVShows()
        let favoritesTVShows: [TVShow] = result.compactMap({ item in
            TVShow(
                id: item.id,
                name: item.name,
                overview: item.overview,
                voteCount: item.voteCount,
                popularity: item.popularity,
                adult: item.adult,
                posterPath: item.posterPath)
        })
        return favoritesTVShows
    }
}
