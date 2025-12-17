//
//  CountriesInteractor.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import Foundation

final class CountriesInteractor: CountriesInteractorProtocol {
    
    weak var presenter: CountriesInteractorOutputProtocol?
    private let service: CountriesServiceProtocol
    
    init(service: CountriesServiceProtocol = CountriesService()){
        
        self.service = service
    }
    
    func fetchCountries(){
        
        service.fetchCountries{ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let countries):
                    self?.presenter?.didFetchCountries(countries)
                case .failure(let error):
                    self?.presenter?.didFail(error)
                }
            }
        }
    }
}
