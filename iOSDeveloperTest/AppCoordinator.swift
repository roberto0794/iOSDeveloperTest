//
//  AppCoordinator.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    
    func start()
    func showCountryDetail(_ country: CountriesEntity)
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let countriesViewController = CountriesRouter.createModule(coordinator: self)
        navigationController.setViewControllers([countriesViewController], animated: false)
    }
    
    func showCountryDetail(_ countryEntity: CountriesEntity) {
        let countryDetailViewController = CountryDetailRouter.createModule(country: countryEntity)
        navigationController.pushViewController(countryDetailViewController, animated: true)
    }
}
