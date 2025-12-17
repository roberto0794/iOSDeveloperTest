//
//  CountriesProtocols.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import Foundation

protocol CountriesViewProtocol: AnyObject {
    
    func showCountries(_ countries: [CountriesEntity])
    func showError(_ message: String)
}

protocol CountriesPresenterProtocol: AnyObject {
    
    func viewDidLoad()
    func didSelectCountry(_ country: CountriesEntity)
}

protocol CountriesInteractorProtocol: AnyObject {
    
    func fetchCountries()
}

protocol CountriesInteractorOutputProtocol: AnyObject {
    
    func didFetchCountries(_ countries: [CountriesEntity])
    func didFail(_ error: NetworkError)
}
