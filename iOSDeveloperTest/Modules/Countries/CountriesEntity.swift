//
//  CountriesEntity.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

struct CountriesEntity: Decodable {
    
    let name: Name
    let region: String?
    let population: Int?
    let flags: Flags?
    let languages: [String: String]?
    
    struct Name: Decodable {
        let common: String
        let official: String?
    }
    
    struct Flags: Decodable {
        let png: String?
        let svg: String?
    }
}
