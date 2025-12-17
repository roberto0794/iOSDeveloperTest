//
//  CountriesPresenter.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import Foundation

final class CountriesPresenter {
    
    weak var view: CountriesViewProtocol?
    var interactor: CountriesInteractorProtocol?
    var coordinator: AppCoordinatorProtocol?
}

extension CountriesPresenter: CountriesPresenterProtocol {
    
    func viewDidLoad(){
        interactor?.fetchCountries()
    }
    
    func didSelectCountry(_ country: CountriesEntity) {
        coordinator?.showCountryDetail(country)
    }
}

extension CountriesPresenter: CountriesInteractorOutputProtocol {
    
    func didFetchCountries(_ countries: [CountriesEntity]) {
        view?.showCountries(
            countries.sorted {$0.name.common < $1.name.common}
        )
    }
    
    func didFail(_ error: NetworkError) {
        
        let message: String
        
        switch error {
        case .noInternet:
            message = "No hay conexión a internet"
        case  .serverError:
            message = "Error del servidor. Intenta más tarde"
        case .decodingError:
            message = "Error procesando los datos"
        default:
            message = "Ocurrió un error inesperado"
        }
        view?.showError(message)
    }                                                                                  
}
