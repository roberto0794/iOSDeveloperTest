//
//  CountryLanguages.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 15/12/25.
//

import Foundation

extension CountriesEntity {
    
    var languagesText: String {
        guard let languages else { return  "N/A" }
        return languages.values.sorted().joined(separator: ", ")
    }
}
