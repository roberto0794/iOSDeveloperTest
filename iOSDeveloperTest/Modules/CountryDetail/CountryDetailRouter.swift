//
//  CountryDetailRouter.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import Foundation
import UIKit

final class CountryDetailRouter: CountryDetailRouterProtocol {
    
    static func createModule(country: CountriesEntity) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(
            identifier: "CountryDetailViewController"
        ) as! CountryDetailViewController
        
        let interactor = CountryDetailInteractor(country: country)
        let presenter = CountryDetailPresenter(
            
            view: view,
            interactor: interactor
        )
        
        view.presenter = presenter
        return view
    }
}
