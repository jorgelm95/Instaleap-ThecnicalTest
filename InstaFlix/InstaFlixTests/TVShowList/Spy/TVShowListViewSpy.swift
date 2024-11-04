//
//  TVShowListViewSpy.swift
//  InstaFlixTests
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import UIKit
@testable import InstaFlix
@testable import InstaFlixDomain

final class TVShowListViewSpy: TVShowListViewType {

    enum Invocation: Int {
        case removeLoading
        case showInformativeAlert
        case setListState
        case showTVShows
    }
    
    var presenter: TVShowListPresenterType?
    var invoctations: [Invocation] = []
    
    func showTVShows(_ tvShows: [InstaFlixDomain.TVShow]) {
        invoctations.append(.showTVShows)
    }
    
    func removeLoading() {
        invoctations.append(.removeLoading)
    }
    
    func showInformativeAlert() {
        invoctations.append(.showInformativeAlert)
    }
    
    func setListState(_ state: InstaFlix.ItemsListState) {
        invoctations.append(.setListState)
    }
}

