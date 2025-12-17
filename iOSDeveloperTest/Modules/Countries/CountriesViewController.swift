//
//  CountriesViewController.swift
//  iOSDeveloperTest
//
//  Created by Roberto on 14/12/25.
//

import UIKit

class CountriesViewController: UIViewController {

    @IBOutlet weak var tableViewCountries: UITableView!
    
    var presenter: CountriesPresenterProtocol?
    private var countries: [CountriesEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Países"
        tableViewCountries.dataSource = self
        tableViewCountries.delegate = self
        presenter?.viewDidLoad()
    }
}

extension CountriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        cell.configure(with: countries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCountry(countries[indexPath.row])
    }
}

extension CountriesViewController: CountriesViewProtocol {
    
    func showCountries(_ countries: [CountriesEntity]) {
        self.countries = countries
        tableViewCountries.reloadData()
    }
    
    func showError(_ message: String) {
        //print("Error loading countries")
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
