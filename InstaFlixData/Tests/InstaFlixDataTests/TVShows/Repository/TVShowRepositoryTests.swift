//
//  FetchTVShowRepositoryTests.swift
//
//
//  Created by Jorge Luis Menco Jaraba on 1/11/24.
//

import Foundation
import XCTest
@testable import InstaFlixData
@testable import InstaFlixDomain

final class TVShowRepositoryTests: XCTestCase {
    
    private var localStorageService: LocalStorageServiceType!
    private var serviceManager: ServiceManagerTVShowMock!
    private var moviesMapperAdapater: MoviesMapperAdapater!
    
    private var sut: FetchTVShowRepository!
    
    override func setUp() {
        super.setUp()
        serviceManager = ServiceManagerTVShowMock()
        localStorageService = LocalStorageServiceManagerMock()
        sut = FetchTVShowRepository(
            serviceManager: serviceManager,
            adapater: TVShowMapperAdapater(),
            localStorageManager: localStorageService)
    }
    
    override func tearDown() {
        super.tearDown()
        serviceManager = nil
        sut = nil
    }
    
    func test_FetchTVShows_WhenServiceReturnOk_then_GetTVShows() {
        //Given
        let expectation = XCTestExpectation(description: "request for get movies")
        
        //When
        
        _ = sut.fetchTVShows().sink { completion in
            switch completion {
            case .finished:
                expectation.fulfill()
                break
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        } receiveValue: { result in
            //Then
            XCTAssertGreaterThan(result.count, 0)
        }
        
        wait(for: [expectation])
    }
    
    func test_FetchTVShow_WhenServiceReturnEror_then_Success() {
        //Given
        serviceManager.isErrorExecution = true
        let expectation = XCTestExpectation(description: "request for get movies")
        
        //When
        
        _ = sut.fetchTVShows().sink { completion in
            switch completion {
            case .finished:
                expectation.fulfill()
                break
            case .failure(let error):
                expectation.fulfill()
                XCTAssertNotNil(error)
            }
        } receiveValue: { result in
            //Then
            XCTFail()
        }
        
        wait(for: [expectation])
    }
    
    func test_FetchFavoritesTVShow_WhenGetFavoriesMoviesinLocal_then_GetTVShows() {
        
        //Given
        sut.addFavoriteTVShow(tvShow: TVShowDummyData.tvShow)
        
        //When
        let result = sut.fetchFavoriteTVShows()
        
        //Then
        XCTAssertGreaterThan(result.count, 0)
    }
    
    func test_SaveFavoriteMovie_WhenGetFavoriesMoviesinLocal_then_GetMovies() {
        
        //Given
        let dummyData = TVShowDummyData.tvShow
        
        //When
        sut.addFavoriteTVShow(tvShow: dummyData)
        
        //Then
        let result = self.localStorageService.fetchFavoriteTVShows()
        XCTAssertGreaterThan(result.count, 0)
    }
}

struct TVShowDummyData {
    
    static let tvShow: TVShow = {
        return TVShow(
            id: "81329",
            name: "Chronicles of the Sun",
            overview: "Claire is surprised when she gets arrested for the murder of her childhood friend after she returns to Montpellier.",
            voteCount: "106",
            popularity: 3511.806,
            adult: false,
            posterPath: "/t6jVlbPMtZOJoAOfeoR4yQmnjXM.jpg")
    }()
}
