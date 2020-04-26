//
//  CovidDataManager.swift
//  Covid-Tracker
//
//  Created by Naidas on 4/25/20.
//  Copyright © 2020 Naidas. All rights reserved.
//

import Foundation
import Alamofire

protocol CovidDataManagerDelegate {
    func didUpdateCovidData(_ covidDataManager: CovidDataManager, covidStats: CovidDataModel)
    func didFailWithError(error: Error)
}

struct CovidDataManager {
    
    //    corona.lmao.ninja/v2
    
    //    let service = CovidDataManager(baseURL: "https://corona.lmao.ninja/v2/countries/")
    //    service.getCountryData(endpoint: countryName)
    //
    //    fileprivate var baseURL = ""
    
    var delegate:  CovidDataManagerDelegate?
    
    let baseURL = "https://corona.lmao.ninja/v2/countries/"
    
    func fetchCovidData(countryName: String) {
        let urlString = "\(baseURL)\(countryName)"
        getCountryData(urlString: urlString)
        
    }
    
    //MARK: - Get all country names request
    
    func getCountryData(urlString: String) {
        
        AF.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard let covidData = responseData.data else {return}
            
            if let covidStats = self.parseJSON(covidData) {
                self.delegate?.didUpdateCovidData(self, covidStats: covidStats)
            }
            
            //            do {
            //                let decodedData = try JSONDecoder().decode(CovidData.self, from: data)
            //
            //                let country = decodedData.country
            //                let cases = decodedData.cases
            //                let todayCases = decodedData.todayCases
            //                let deaths = decodedData.deaths
            //                let todayDeaths = decodedData.todayDeaths
            //                let recovered = decodedData.recovered
            //                let tests = decodedData.tests
            //
            //                let covidData = CovidDataModel(countryName: country, totalCases: cases, totalDeaths: deaths, casesToday: todayCases, deathsToday: todayDeaths, totalRecovered: recovered, totalTests: tests)
            //
            //
            //
            //            } catch {
            //                print("Error decoding countries \(error)")
            //            }
            
        }
    }
    
    func parseJSON(_ covidData: Data) -> CovidDataModel? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CovidData.self, from: covidData)
            
            let country = decodedData.country
            let cases = decodedData.cases
            let todayCases = decodedData.todayCases
            let deaths = decodedData.deaths
            let todayDeaths = decodedData.todayDeaths
            let recovered = decodedData.recovered
            let tests = decodedData.tests
            
            let covidStats = CovidDataModel(countryName: country, totalCases: cases, totalDeaths: deaths, casesToday: todayCases, deathsToday: todayDeaths, totalRecovered: recovered, totalTests: tests)
            
            print(covidStats)
            
            return covidStats
            
            
        } catch {
            print("Error decoding countries \(error)")
            return nil
        }
    }
}
