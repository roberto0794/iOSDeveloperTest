//
//  CountryDetailInteractor.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import Foundation

final class CountryDetailInteractor: CountryDetailInteractorProtocol {
    
    let country: CountriesEntity
    
    init(country: CountriesEntity) {
        self.country = country
    }
}
