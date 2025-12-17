//
//  APIService.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import Foundation

enum APIService {
    
    static let baseURL = "https://restcountries.com/v3.1/"
    case allCountries
    
    var url: URL? {
        switch self {
        case .allCountries:
            return URL(string: Self.baseURL + "all?fields=name,flags,population,languages")
        }
    }
}
