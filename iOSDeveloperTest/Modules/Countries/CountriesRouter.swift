//
//  CountriesRouter.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import Foundation
import UIKit

final class CountriesRouter {
    
    static func createModule(coordinator: AppCoordinatorProtocol) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(
            identifier: "CountriesViewController"
        ) as! CountriesViewController
        
        let presenter = CountriesPresenter()
        let interactor = CountriesInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.coordinator = coordinator
        interactor.presenter = presenter
        
        return view
    }
}
