//
//  NetworkError.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(Int)
    case noInternet
    case unknow
}
