//
//  TrackerTrackerViewController.swift
//  Covid-Tracker
//
//  Created by Naidas on 4/25/20.
//  Copyright © 2020 Naidas. All rights reserved.
//

import UIKit

class TrackerViewController: UIViewController {
    
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
        
        let service = CovidDataManager(baseURL: "https://corona.lmao.ninja/v2/countries/")
        service.getAllCountryData(endpoint: "philippines")
    }

    @IBAction func searchedPressed(_ sender: Any) {
        print(searchTextField.text!)
    }
    
    @IBAction func getLocationPressed(_ sender: Any) {
        print("location pressed")
    }
    
    
}

