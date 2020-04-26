//
//  CovidDataModel.swift
//  Covid-Tracker
//
//  Created by Naidas on 4/25/20.
//  Copyright © 2020 Naidas. All rights reserved.
//

import Foundation


struct CovidDataModel: Codable {
    
    let dateTimeUpdated: Int
    let countryName: String
    
    let totalCases: Int
    let totalDeaths: Int
    
    let casesToday: Int
    let deathsToday: Int
    let totalRecovered: Int
    let totalTests: Int
    
    var dateTimeUpdatedString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let DTString = formatter.string(from: Date())
        
        return DTString
    }
    
    var totalCasesString: String {
        return String(totalCases)
    }
    
    var totalDeathsString: String {
        return String(totalDeaths)
    }
    
    var casesTodayString: String {
        return String(casesToday)
    }
    
    var deathsTodayString: String {
        return String(deathsToday)
    }
    
    var totalRecoveredString: String {
        return String(totalRecovered)
    }
    
    var totalTestsString: String {
        return String(totalTests)
    }
    
    
}
