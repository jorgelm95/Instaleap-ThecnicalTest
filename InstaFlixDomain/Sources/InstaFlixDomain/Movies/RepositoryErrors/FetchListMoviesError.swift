//
//  FetchListMoviesError.swift
//
//
//  Created by Jorge Luis Menco Jaraba on 25/09/24.
//

import Foundation

// Enum for manage the posible bussines errors presented in the operation for fetch movies
public enum FetchRequestErrors: Error {
    case invalidResponse
    case undefined
}
