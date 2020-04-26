//
//  TrackerTrackerViewController.swift
//  Covid-Tracker
//
//  Created by Naidas on 4/25/20.
//  Copyright © 2020 Naidas. All rights reserved.
//

import UIKit
import CountryPickerView

class TrackerViewController: UIViewController {
    
    let cpvInternal = CountryPickerView()
    let covidDataManager = CovidDataManager()
    weak var cpvTextField: CountryPickerView!
    var countryName = ""
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var currentCasesLabel: UILabel!
    @IBOutlet weak var currentDeathsLabel: UILabel!
    
    @IBOutlet weak var newCasesLabel: UILabel!
    @IBOutlet weak var newRecoveriesLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var totalTestsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cpvInternal.delegate = self
    }
    
    @IBAction func searchedPressed(_ sender: Any) {
        print(searchTextField.text!)
    }
    
    @IBAction func getLocationPressed(_ sender: Any) {
        print("location pressed")
        
    }
    
    @IBAction func searchFieldPressed(_ sender: UITextField) {
        if let nav = navigationController {
            cpvInternal.showCountriesList(from: nav)
        } else {
            print("error presenting the list")
        }
        searchTextField.endEditing(true)
    }
}

extension TrackerViewController: CountryPickerViewDelegate {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        
        func getCovidDatafromCountry() {
            covidDataManager.fetchCovidData(countryName: countryName)
        }
        
        if country.name == "South Korea" {
            countryName = "S.%20Korea"
            getCovidDatafromCountry()
            
        } else if country.name == "United States" {
            countryName = "USA"
            getCovidDatafromCountry()
            
        } else {
            
            countryName = country.name
            getCovidDatafromCountry()
            searchTextField.text = countryName
            
        }
    }
}
