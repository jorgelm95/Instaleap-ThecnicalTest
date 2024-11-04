//
//  DummyTVShowData.swift
//  InstaFlixTests
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation
@testable import InstaFlixDomain

struct DummyTVShowData {
    static let tvShows: [TVShow] = {
        return [
            TVShow(
                id: "81329",
                name: "Chronicles of the Sun",
                overview: "Claire is surprised when she gets arrested for the murder of her childhood friend after she returns to Montpellier.",
                voteCount: "106",
                popularity: 3511.806,
                adult: false,
                posterPath: "/t6jVlbPMtZOJoAOfeoR4yQmnjXM.jpg")]
    }()
}
