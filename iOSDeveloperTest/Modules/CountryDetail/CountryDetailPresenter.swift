//
//  CountryDetailPresenter.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import Foundation

final class CountryDetailPresenter: CountryDetailPresenterProtocol {
    
    weak var view: CountryDetailViewProtocol?
    var interactor: CountryDetailInteractorProtocol?
    
    init(view: CountryDetailViewProtocol, interactor: CountryDetailInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.showCountry(interactor!.country)
    }
}
