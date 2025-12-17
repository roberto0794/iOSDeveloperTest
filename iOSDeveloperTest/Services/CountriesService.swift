//
//  CountriesService.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

protocol CountriesServiceProtocol {
    
    func fetchCountries(
        completion: @escaping(Result<[CountriesEntity], NetworkError>) -> Void
    )
}

final class CountriesService: CountriesServiceProtocol {
    
    func fetchCountries(completion: @escaping (Result<[CountriesEntity], NetworkError>) -> Void){
        
        APIClient.shared.request(
            endpoint: .allCountries,
            completion: completion
        )
    }
}
