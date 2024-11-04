//
//  TVShowListPresenterIntegrationTests.swift
//  InstaFlixTests
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation
import XCTest
import Combine
@testable import InstaFlix
@testable import InstaFlixDomain

final class TVShowListPresenterIntegrationTests: XCTestCase {
    
    private var interactor: TVShowListInteractorType!
    private var view: TVShowListViewController!
    private var routerSpy: TVShowListRouterSpy!
    private var repository: TVShowRepositoryStub!
    
    private var sut: TVShowListPresenter!
    
    override func setUp() {
        super.setUp()
        repository = TVShowRepositoryStub()
        interactor = TVShowInteractor(repository: repository)
        view = TVShowListViewController()
        routerSpy = TVShowListRouterSpy()
        sut = TVShowListPresenter(
            interactor: interactor,
            view: view,
            showFavoritesMovies: false)
        sut.router = routerSpy
        interactor.presenter = sut
    }
    
    func test_fetchTVShows_WhenGetRequestIsSuccess_ThenShowTVShows() {

        //When
        sut.fetchTVshows()
        
        //Then
        XCTAssertEqual(view.tableViewState, .filled)
        XCTAssertGreaterThan(view.items.count, 0)
    }
    
    func test_fetchMovies_WhenGetInvalidResponseError_then_ListStateIsEptyResult() {
        //Given
        repository.error = .invalidResponse
        repository.setFailureResponse = true
        //When
        sut.fetchTVshows()
        
        //Then
        XCTAssertEqual(view.tableViewState, .emptyResults)
        XCTAssertEqual(view.items.count, 0)
    }
    
    func test_fetchMovie_WhenGeTUndefineError_then_ListStateIsNetworkrError() {
        
        //Given
        repository.error = .undefined
        repository.setFailureResponse = true
        
        //When
        sut.fetchTVshows()
        
        //Then
        XCTAssertEqual(view.items.count, 0)
    }
    
    func test_goToMovieDeatil_TapInAnyMovie_then_SentToDetailMovie() {
        
        //Given
        sut.fetchTVshows()
        
        //When
        sut.goToDetail(index: 0)
        
        //Then
        XCTAssertEqual(routerSpy.invocations, [.goToDetailTVshow])
    }
}
