//
//  FetchTVShowsRequest.swift
//
//
//  Created by Jorge Luis Menco Jaraba on 1/11/24.
//

import Foundation
import InstaFlixNetworking

struct FetchTVShowsRequest: RequestType {
    
    typealias Output = ResponseResult<APITVShowsResult>
    
    var baseUrl: URL { URL(string: "https://api.themoviedb.org")! }
    var path: String { "/3/tv/popular" }
    var queryParams: HTTPQueryParams {["api_key":"4b762d6d979ef357f4e347efe1ffa4cd"]}
    var method: HTTPMethod { .get }
    
    func decode(data: Data, httpCode: Int) throws -> ResponseResult<APITVShowsResult> {
        let decoder = JSONDecoder()

        if  !data.isEmpty {
            return Output(
                response: try decoder.decode(Output.Response.self, from: data),
                httpCode: httpCode)
        } else {
            return  ResponseResult<APITVShowsResult>(response: APITVShowsResult(results: []), httpCode: httpCode)
        }
    }
}
