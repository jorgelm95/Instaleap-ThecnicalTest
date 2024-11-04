//
//  TVShowMapperAdapater.swift
//
//
//  Created by Jorge Luis Menco Jaraba on 1/11/24.
//

import Foundation
import InstaFlixDomain

public protocol TVShowMapperAdapaterAble {
    func mapTVShowToDomainModel(apiData: APITVShowsResult) -> [TVShow]
}

public final class TVShowMapperAdapater: TVShowMapperAdapaterAble {
    
    public init() {}
    
    public func mapTVShowToDomainModel(apiData: APITVShowsResult) -> [TVShow] {
        let result = apiData.results.compactMap { tvShow in
            TVShow(
                id: String(tvShow.id),
                name: tvShow.name,
                overview: tvShow.overview,
                voteCount: String(tvShow.voteCount),
                popularity: tvShow.popularity,
                adult: tvShow.adult,
                posterPath: tvShow.posterPath)
        }
        return result
    }
}
