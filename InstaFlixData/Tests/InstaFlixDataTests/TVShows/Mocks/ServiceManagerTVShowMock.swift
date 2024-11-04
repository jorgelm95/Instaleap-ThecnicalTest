//
//  ServiceManagerTVShowMock.swift
//
//
//  Created by Jorge Luis Menco Jaraba on 1/11/24.
//

import Foundation
import Combine
@testable import InstaFlixData
@testable import InstaFlixNetworking
@testable import InstaFlixDomain

final class ServiceManagerTVShowMock: ServiceManagerType {
    
    var isErrorExecution: Bool = false
    var errorExecution: ErrorHTTP.API = .undefined
    
    func execute<R>(_ request: R) -> AnyPublisher<R.Output, ErrorHTTP.API> where R : RequestType {
        
        if isErrorExecution {
            return Fail<R.Output, ErrorHTTP.API>(error: errorExecution).eraseToAnyPublisher()
        }
        
        return Future<R.Output, ErrorHTTP.API> { promise in
            promise(.success(
                ResponseResult<APITVShowsResult>(
                    response: APITVShowsResult(
                        results: [
                            APITVShow(
                                id: 81329,
                                name: "Chronicles of the Sun",
                                overview: "Claire is surprised when she gets arrested for the murder of her childhood friend after she returns to Montpellier.",
                                voteCount: 106,
                                popularity: 3511.806,
                                adult: false,
                                posterPath: "/t6jVlbPMtZOJoAOfeoR4yQmnjXM.jpg")
                        ]),
                    httpCode: 200)
                as! R.Output)
            )}.eraseToAnyPublisher()
    }
    
    func handleDataTaskOutput(urlResponse: URLResponse, data: Data) throws -> (httpCode: Int, data: Data) {
        return (200, Data())
    }
}
