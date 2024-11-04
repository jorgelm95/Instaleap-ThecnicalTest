//
//  TVShow.swift
//  
//
//  Created by Jorge Luis Menco Jaraba on 1/11/24.
//

import Foundation

public struct TVShow {
    public let id: String
    public let name: String
    public let overview: String
    public let voteCount: String
    public let popularity: Double
    public let adult: Bool
    public let posterPath: String
    
    public init(id: String, name: String, overview: String, voteCount: String, popularity: Double, adult: Bool, posterPath: String) {
        self.id = id
        self.name = name
        self.overview = overview
        self.voteCount = voteCount
        self.popularity = popularity
        self.adult = adult
        self.posterPath = posterPath
    }
}
