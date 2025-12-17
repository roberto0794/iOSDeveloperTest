//
//  CountryDetailProtocols.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import Foundation
import UIKit

protocol CountryDetailViewProtocol: AnyObject {
    func showCountry(_ country: CountriesEntity)
}

protocol CountryDetailPresenterProtocol: AnyObject {
    
    func viewDidLoad()
}

protocol CountryDetailInteractorProtocol: AnyObject {
    
    var  country: CountriesEntity { get }
}

protocol CountryDetailInteractorOutputProtocol: AnyObject {
    
    func didLoadCountry(_ country: CountriesEntity)
}

protocol CountryDetailRouterProtocol: AnyObject {
    static func createModule(country: CountriesEntity) -> UIViewController
}
