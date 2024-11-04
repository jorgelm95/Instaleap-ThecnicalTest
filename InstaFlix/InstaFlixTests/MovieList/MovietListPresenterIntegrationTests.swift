//
//  MovietListPresenterIntegrationTests.swift
//  InstaFlixTests
//
//  Created by Jorge Luis Menco Jaraba on 26/09/24.
//

import XCTest
import Combine
@testable import InstaFlix
@testable import InstaFlixDomain

final class MovietListPresenterIntegrationTests: XCTestCase {
    
    private var interactor: MovieListInteractorType!
    private var view: MovieListViewController!
    private var routerSpy: MovieListRouterSpy!
    private var repository: MovieRepositoryStub!
    
    private var sut: MovieListPresenter!
    
    override func setUp() {
        super.setUp()
        repository = MovieRepositoryStub()
        interactor = MovieListInteractor(repository: repository)
        view = MovieListViewController()
        routerSpy = MovieListRouterSpy()
        sut = MovieListPresenter(
            interactor: interactor,
            view: view,
            showFavoritesMovies: false)
        sut.router = routerSpy
        interactor.presenter = sut
    }
    
    func test_fetchMovies_WhenShowFavoritesMovieIsNo_then_GetAllMovies() {
        //Given
        sut.shouldShouwFavoriteMovie = false
        
        //When
        sut.fetchMovies()
        
        //Then
        XCTAssertEqual(view.tableViewState, .filled)
        XCTAssertGreaterThan(view.items.count, 0)
    }
    
    func test_fetchMovies_WhenShowFavoritesMovieIsYes_then_GetFavoriteMovies() {
        //Given
        
        //When
        sut.fetchMovies()
        
        //Then
        XCTAssertEqual(view.tableViewState, .filled)
        XCTAssertGreaterThan(view.items.count, 0)
    }
    
    func test_fetchMovies_WhenGetInvalidResponseError_then_ListStateIsEptyResult() {
        //Given
        repository.error = .invalidResponse
        repository.setFailureResponse = true
        //When
        sut.fetchMovies()
        
        //Then
        XCTAssertEqual(view.tableViewState, .emptyResults)
        XCTAssertEqual(view.items.count, 0)
    }
    
    func test_fetchMovie_WhenGeTUndefineError_then_ListStateIsNetworkrError() {
        
        //Given
        repository.error = .undefined
        repository.setFailureResponse = true
        
        //When
        sut.fetchMovies()
        
        //Then
        XCTAssertEqual(view.items.count, 0)
    }
    
    func test_goToMovieDeatil_TapInAnyMovie_then_SentToDetailMovie() {
        
        //Given
        let movie = DummyMovieData.movieData
        sut.fetchMovies()
        
        //When
        sut.goToMovieDetail(index: 0)
        
        //Then
        XCTAssertEqual(routerSpy.invocations, [.goToDetailMovie])
    }
}
