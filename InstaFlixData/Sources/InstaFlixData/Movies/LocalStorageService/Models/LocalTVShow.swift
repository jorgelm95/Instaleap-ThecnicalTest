//
//  LocalTVShow.swift
//
//
//  Created by Jorge Luis Menco Jaraba on 1/11/24.
//

import RealmSwift

public class LocalTVShow: Object {
    @Persisted var id: String
    @Persisted var name: String
    @Persisted var overview: String
    @Persisted var voteCount: String
    @Persisted var popularity: Double
    @Persisted var adult: Bool
    @Persisted var posterPath: String
}
