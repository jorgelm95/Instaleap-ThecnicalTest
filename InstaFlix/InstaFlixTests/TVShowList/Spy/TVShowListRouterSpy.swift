//
//  TVShowListRouterSpy.swift
//  InstaFlixTests
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import UIKit
@testable import InstaFlix
@testable import InstaFlixDomain

final class TVShowListRouterSpy: TVShowListRouterType {

    var viewControllerRef: UIViewController?
    enum Invocation: Int {
       case goToDetailTVshow
   }
   
   var invocations: [Invocation] = []
   
    func goToDetailTVShowModule(_ tvShow: TVShow) {
        invocations.append(.goToDetailTVshow)
    }
}
