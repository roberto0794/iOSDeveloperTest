//
//  CountryDetailViewController.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    @IBOutlet weak var imgCountryFlag: UIImageView!
    @IBOutlet weak var txtCountryName: UILabel!
    @IBOutlet weak var txtPopulation: UILabel!
    @IBOutlet weak var txtLanguage: UILabel!
    
    var presenter: CountryDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgCountryFlag.layer.cornerRadius = 16
        imgCountryFlag.layer.borderWidth = 1
        imgCountryFlag.layer.borderColor = UIColor.systemGray4.cgColor
        imgCountryFlag.clipsToBounds  = true
    }
}

extension CountryDetailViewController: CountryDetailViewProtocol {
    func showCountry(_ country: CountriesEntity) {
        
        title = country.name.common
        
        if let urlString = country.flags?.png,
           let url = URL(string: urlString) {
            imgCountryFlag.loadImage(from: url)
        }
        
        txtCountryName.text = country.name.official ?? country.name.common
        
        if let  population = country.population {
            txtPopulation.text  = "Población: \(population)"
        }
        else {
            txtPopulation.text = "N/A"
        }
        
        txtLanguage.text = "Idiomas: " + country.languagesText
    }
}
