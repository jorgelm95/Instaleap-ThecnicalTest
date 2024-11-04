//
//  TVShowListPresenterTests.swift
//  InstaFlixTests
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import XCTest
@testable import InstaFlix
@testable import InstaFlixDomain

final class TVShowListPresenterTests: XCTestCase {
    
    private var interactor: TVShowInteractorStub!
    private var viewSpy: TVShowListViewSpy!
    private var routerSpy: TVShowListRouterSpy!
    private var sut: TVShowListPresenter!
    
    override func setUp() {
        super.setUp()
        interactor = TVShowInteractorStub(repository: TVShowRepositoryStub())
        viewSpy = TVShowListViewSpy()
        routerSpy = TVShowListRouterSpy()
        sut = TVShowListPresenter(
            interactor: interactor,
            view: viewSpy,
            showFavoritesMovies: false)
        sut.router = routerSpy
        interactor.presenter = sut
    }
    
    override func tearDown() {
        super.tearDown()
        viewSpy = nil
        routerSpy = nil
        interactor = nil
        sut = nil
    }
    
    func test_fetchTVShows_WhenShowFavoritesMovieIsNo_then_GetAllTVShowsFromService() {
        
        //When
        sut.fetchTVshows()
        
        //Then
        XCTAssertEqual(viewSpy.invoctations, [.removeLoading, .showTVShows])
    }
    
    func test_fetchTVShows_WhenGetInvalidResponseError_then_ListStateIsEptyResult() {
        //Given
        interactor.setFailureResponse = true
        interactor.error = .invalidResponse
        
        //When
        sut.fetchTVshows()
        
        //Then
        XCTAssertEqual(viewSpy.invoctations, [.removeLoading, .setListState])
    }
    
    func test_fetchTVShows_WhenGeTUndefineError_then_ListStateIsNetworkrError() {
        
        //Given
        interactor.setFailureResponse = true
        interactor.error = .undefined
        
        //When
        sut.fetchTVshows()
        
        //Then
        XCTAssertEqual(viewSpy.invoctations, [.removeLoading, .setListState])

    }
    
    func test_saveFavorite_WhenSaveFavoriteTVshow_then_getShowAlertInfoCalled() {
        
        //Given
        let dummyData = DummyMovieData.movieData
//        sut.interactor.fetchMovies()
        
        //When
        sut.saveFavorite(index: 0)
        
        //Then
        XCTAssertEqual(viewSpy.invoctations, [.showInformativeAlert])
    }
    
    func test_goToTVShowDetail_TapInAnyTVShow_then_SentToDetail() {
        
        //Given
        sut.interactor.fetchTVshows()
        
        //When
        sut.goToDetail(index: 0)
        
        //Then
        XCTAssertEqual(routerSpy.invocations, [.goToDetailTVshow])
    }
}
