//
//  CountryTableViewCell.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 15/12/25.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCountryFlag: UIImageView!
    @IBOutlet weak var txtCountryName: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgCountryFlag.image = nil
    }
    
    func configure(with country: CountriesEntity) {
        imgCountryFlag.layer.cornerRadius = 12
        imgCountryFlag.layer.borderWidth = 1
        imgCountryFlag.layer.borderColor = UIColor.systemGray4.cgColor
        imgCountryFlag.clipsToBounds  = true
        
        txtCountryName.text = country.name.common
        
        if let urlString = country.flags?.png,
           let url = URL(string: urlString) {
            imgCountryFlag.loadImage(from: url)
        }
    }
}
