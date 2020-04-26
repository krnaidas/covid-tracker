//
//  WorldCovidDataManager.swift
//  Covid-Tracker
//
//  Created by Naidas on 4/26/20.
//  Copyright © 2020 Naidas. All rights reserved.
//

import Foundation
import Alamofire

protocol WorldCovidDataManagerDelegate {
    
    func didUpdateWorldCovidData(_ worldCovidDataManager: WorldCovidDataManager, worldCovidStats: WorldCovidDataModel)
    func didFailWithError(error: Error)
}

struct WorldCovidDataManager {
    
    var delegate: WorldCovidDataManagerDelegate?
    
    let worldURL = "https://corona.lmao.ninja/v2/all"
    
    func fetchWorldCovidData() {
        
        let urlStringWorld = worldURL
        
        getWorldData(urlString: urlStringWorld)
    }
    
    //MARK: - Get World Request
    
    func getWorldData(urlString: String) {
        
        AF.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard let worldCovidData = responseData.data else {return}
            
            if let worldCovidStats = self.parseJSON(worldCovidData) {
                self.delegate?.didUpdateWorldCovidData(self, worldCovidStats: worldCovidStats)
            }
        }
    }
    
    func parseJSON(_ worldCovidData: Data) -> WorldCovidDataModel? {
        
        let decoder = JSONDecoder()
        
        do {
            
            let decodedData = try decoder.decode(WorldCovidData.self, from: worldCovidData)
            
            let updated = decodedData.updated
            let cases = decodedData.cases
            let todayCases = decodedData.todayCases
            let deaths = decodedData.deaths
            let todayDeaths = decodedData.todayDeaths
            let recovered = decodedData.recovered
            let tests = decodedData.tests
            
            let worldCovidStats = WorldCovidDataModel(dateTimeUpdated: updated, totalCases: cases, totalDeaths: deaths, casesToday: todayCases, deathsToday: todayDeaths, totalRecovered: recovered, totalTests: tests)
            
            return worldCovidStats
        } catch {
            print("Error decoding world data \(error)")
            return nil
        }
    }
    
}
