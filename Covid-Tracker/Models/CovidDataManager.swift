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
    
    fileprivate var baseURL = ""
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    //MARK: - Get all country names
    
    func getCountryData(endpoint: String) {
        
        AF.request(self.baseURL + endpoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard let data = responseData.data else {return}
            do {
                let decodedData = try JSONDecoder().decode(CovidData.self, from: data)
                print(decodedData)
                
            } catch {
                print("Error decoding countries \(error)")
            }
            
        }
    }
}
