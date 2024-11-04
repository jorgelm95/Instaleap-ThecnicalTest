//
//  TVshowLocalStorageRepositoryTye.swift
//  
//
//  Created by Jorge Luis Menco Jaraba on 1/11/24.
//

import Foundation
import Combine

public typealias TvShowRepository = TVShowRepositoryType & TVshowLocalStorageRepositoryTye

public protocol TVShowRepositoryType: AnyObject {
    func fetchTVShows() -> AnyPublisher<[TVShow], FetchRequestErrors>
    
}

public protocol TVshowLocalStorageRepositoryTye {
    func addFavoriteTVShow(tvShow: TVShow)
    func fetchFavoriteTVShows() -> [TVShow]
}
