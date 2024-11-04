//
//  FetchMoviesRequest.swift
//
//
//  Created by Jorge Luis Menco Jaraba on 25/09/24.
//

import Foundation
import InstaFlixNetworking

struct FetchMoviesRequest: RequestType {
    
    typealias Output = ResponseResult<APIMoviesResult>
    
    var baseUrl: URL { URL(string: "https://api.themoviedb.org")! }
    var path: String { "/3/movie/popular" }
    var queryParams: HTTPQueryParams {["api_key":"4b762d6d979ef357f4e347efe1ffa4cd"]}
    var method: HTTPMethod { .get }
    
    func decode(data: Data, httpCode: Int) throws -> ResponseResult<APIMoviesResult> {
        let decoder = JSONDecoder()

        if  !data.isEmpty {
            printData(for: data)
            return Output(
                response: try decoder.decode(Output.Response.self, from: data),
                httpCode: httpCode)
        } else {
            return  ResponseResult<APIMoviesResult>(response: APIMoviesResult(results: []), httpCode: httpCode)
        }
    }
    
    private func printData(for data: Data) {
        guard let json = getJsonResponse(for: data) else {
            return
        }
        debugPrint("[HTTP RESPONSE] ", json)
    }
    
    private func getJsonResponse(for data: Data) -> Dictionary<String, Any>? {
        
        let object = try? JSONSerialization.jsonObject(with: data)
        let prettyPrintedData = try? JSONSerialization.data(
            withJSONObject: object,
            options: [.prettyPrinted, .sortedKeys]
        )
        let prettyPrintedString = String(data: prettyPrintedData!, encoding: .utf8)!
        
        return try? JSONSerialization.jsonObject(with: prettyPrintedData!, options: []) as? [String: Any]
    }
}
