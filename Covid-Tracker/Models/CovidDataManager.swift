//
//  CovidDataManager.swift
//  Covid-Tracker
//
//  Created by Naidas on 4/25/20.
//  Copyright © 2020 Naidas. All rights reserved.
//

import Foundation
import Alamofire

struct CovidDataManager {
    
//    corona.lmao.ninja/v2
    
//    let service = CovidDataManager(baseURL: "https://corona.lmao.ninja/v2/countries/")
//    service.getCountryData(endpoint: countryName)
//
//    fileprivate var baseURL = ""
    
    let baseURL = "https://corona.lmao.ninja/v2/countries/"

    func fetchCovidData(countryName: String) {
        let urlString = "\(baseURL)\(countryName)"
        getCountryData(urlString: urlString)
        
    }
    
    //MARK: - Get all country names request
    
    func getCountryData(urlString: String) {
        
        AF.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard let data = responseData.data else {return}
            do {
                let decodedData = try JSONDecoder().decode(CovidData.self, from: data)
                print(decodedData.cases)
                
            } catch {
                print("Error decoding countries \(error)")
            }
            
        }
    }
}
