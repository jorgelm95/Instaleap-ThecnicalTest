//
//  APITVShowsResult.swift
//
//
//  Created by Jorge Luis Menco Jaraba on 1/11/24.
//

import Foundation

public struct APITVShowsResult: Decodable {
    public let results: [APITVShow]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

public struct APITVShow: Decodable {
    public let id: Int
    public let name: String
    public let overview: String
    public let voteCount: Int
    public let popularity: Double
    public let adult: Bool
    public let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, overview, popularity, adult
        case voteCount = "vote_count"
        case posterPath = "poster_path"
    }
}
